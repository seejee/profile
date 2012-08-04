function Wavelet97JS() {
    var kMaxFilterSize = 9;
    var kMaxBoundSize = kMaxFilterSize >> 1;
    var kSubbandTileSize = 256;
    var kInverseTileSize = kSubbandTileSize + 4 * kMaxBoundSize;
    var kInverseNrPixels = kInverseTileSize * kInverseTileSize;

    // Constants for bounds array
    var kLeft = 0;
    var kRight = 1;
    var kTop = 2;
    var kBottom = 3;

    // Constants for 9,7 filter. 
    var kAlpha = -1.586134342;
    var kBetta = -0.05298011854;
    var kGamma = 0.8829110762;
    var kDelta = 0.4435068522;
    var kEtta = 1.149604398;
    var kEttaDelta = kEtta * kDelta;
    var kOneOverEtta = (1.0 / kEtta);

		this.getInverseNrPixels = function() {
			return kInverseNrPixels;
		};
		
		this.getSubbandTileSize = function() {
			return kSubbandTileSize;
		};

    this.inverseNineSevenRow = function(outRow, inRow, blockSize, offset, doLeft, doRight) {
        // Constants used during processing
        var hBlockSize = blockSize / 2;
        var qStop = blockSize + 3 * offset;
        var offEnd = offset + hBlockSize;
        var qOff = hBlockSize + 3 * offset;
        var qEnd = qOff + blockSize - 1 - hBlockSize;

        /*************** FIRST STEP: X reversed update & scale (2) *****************/

        // Processing depend on border handling
        var leftLambda = (doLeft) ? kOneOverEtta * inRow[offset - 1] - kEttaDelta * (inRow[qOff - 2] + inRow[qOff - 1]) : kOneOverEtta * inRow[offset + 1] - kEttaDelta * (inRow[qOff + 1] + inRow[qOff]);

        // First intermediate value of border depends on left border 
        outRow[0] = (doLeft) ? kOneOverEtta * inRow[offset] - kEttaDelta * (inRow[qOff - 1] + inRow[qOff]) : kOneOverEtta * inRow[offset] - kEttaDelta * (inRow[qOff] + inRow[qOff]);

        // Inner processing step of the first step - this loop is computationally intensive and could benefit
        // from vectorization, but that is unlikely to happen with the CLR
        for (j = 1; j < hBlockSize; ++j) {
            outRow[j + j] = kOneOverEtta * inRow[offset + j] - kEttaDelta * (inRow[qOff + j] + inRow[qOff + j + 1]);
        }

        // Handling of right border 
        var rightLambda0 = (doRight) ? kOneOverEtta * inRow[offEnd] - kEttaDelta * (inRow[qStop] + inRow[qStop + 1]) : kOneOverEtta * inRow[offEnd - 1] - kEttaDelta * (inRow[qStop] + inRow[qStop - 1]);

        var rightLambda1 = (doRight) ? kOneOverEtta * inRow[offEnd + 1] - kEttaDelta * (inRow[qStop + 1] + inRow[qStop + 2]) : (blockSize > 4) ? kOneOverEtta * inRow[offEnd - 2] - kEttaDelta * (inRow[qStop - 1] + inRow[qStop - 2]) : kOneOverEtta * inRow[offEnd - 2] - kEttaDelta * (inRow[qStop - 1] + inRow[qStop - 1]);

        /*************** SECOND STEP: X reversed prediction (2) *****************/

        // Again, handle border separately
        var leftGamma = (doLeft) ? kEtta * inRow[qOff - 1] - kGamma * (leftLambda + outRow[0]) : kEtta * inRow[qOff] - kGamma * (leftLambda + outRow[0]);

        // Computationally intensive loop of first step
        var k = 1;
        for (j = qOff; j < qEnd; ++j, k += 2) {
            outRow[k] = kEtta * inRow[j] - kGamma * (outRow[k - 1] + outRow[k + 1]);
        }

        // Handle boundary case
        outRow[k] = kEtta * inRow[qEnd] - kGamma * (outRow[k - 1] + rightLambda0);

        var rightGamma = (doRight) ? kEtta * inRow[qEnd + 1] - kGamma * (rightLambda0 + rightLambda1) : kEtta * inRow[qEnd - 1] - kGamma * (rightLambda0 + rightLambda1);

        /*************** THIRD STEP: X reversed update (1) *****************/

        // left border
        outRow[0] = outRow[0] - kBetta * (leftGamma + outRow[1]);

        // inner computational loop
        for (s = 2; s < blockSize; s += 2) {
            outRow[s] -= kBetta * (outRow[s - 1] + outRow[s + 1]);
        }

        // right border
        rightLambda0 -= kBetta * (outRow[blockSize - 1] + rightGamma);

        /*************** FOURTH STEP: X reversed prediction (1) *****************/

        for (s = 1; s < blockSize - 1; s += 2) {
            outRow[s] -= kAlpha * (outRow[s - 1] + outRow[s + 1]);
        }

        // special case of last prediction
        outRow[blockSize - 1] -= kAlpha * (outRow[blockSize - 2] + rightLambda0);
    };

    this.inverseNineSeven = function(image, blockSize, offset, bound) {

        var hBlockSize = blockSize / 2;
        var startCol = bound[kLeft] ? 0 : offset;
        var endCol = blockSize + offset * (bound[kRight] ? 4 : 3);
        var nColCoef = blockSize + 4 * offset;

        // Create two small temporary arrays to hold scratch data. Would like to do that on the stack (gave a 
        // significant speed bump in C++) but C# wants to use the stack
        var tmpOut = new Array(kInverseTileSize);
        var tmpIn = new Array(kInverseTileSize);


        // The 2D transform is performed by doing successive 1D transforms, first along the columns and then
        // along the rows of the image. Start with the columns:
        for (jCol = startCol; jCol < endCol; ++jCol) {
            // handle boundaries correctly by modifying jCol if appropriate.
            if (bound[kBottom] && jCol == (offset + hBlockSize)) {
                jCol += offset;
            }
            
            if (bound[kTop] && jCol == (2 * offset + hBlockSize)) {
                jCol += offset;
            }

            // Copy column to temporary array. This copying loop addresses against the stride; 
            //  # of cache lines that are hit is 272, exceeding L1 cache capacity so this loop is L2 cache 
            // bound (cache used is 272*64 bytes = 19K).
            // At 600 tiles per second, this innerloop touches 600*272*272*64 bytes/s, which is 2709 MB/s.  
            for (i = 0; i < nColCoef; ++i) {
                tmpIn[i] = image[jCol + i * kInverseTileSize];
            }
	
            // perform 1D wavelet transform
            this.inverseNineSevenRow(tmpOut, tmpIn, blockSize, offset, bound[kTop], bound[kBottom]);

            // copy back to input image
            for (i = 0; i < nColCoef; ++i) {
                image[jCol + i * kInverseTileSize] = tmpOut[i];
            }
        }

        // Now transform the rows. 
        for (row = 0; row < blockSize; ++row) {
            var off = row * kInverseTileSize;
            for (i = 0; i < blockSize; ++i) {
                tmpIn[i] = image[off + i];
            }
            this.inverseNineSevenRow(tmpOut, tmpIn, blockSize, offset, bound[kLeft], bound[kRight]);
            for (i = 0; i < blockSize; ++i) {
                image[off + i] = tmpOut[i];
            }
        }
    };
}

$(function() {
	var a = new Wavelet97JS();
	
	var image = new Array(a.getInverseNrPixels());
  var bounds = [false, true, true, false];

	var iterations = 0;
	
	var start = (new Date).getTime();
	
	while(((new Date).getTime() - start) <= 1000) {
		a.inverseNineSeven(image,a.getSubbandTileSize(), 2, bounds);
		iterations++;
	}
	
	console.log(iterations);

});
