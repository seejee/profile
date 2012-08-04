var Omnyx = function() {
	
	return {
		Viewer: function Viewer(c) {
	
			this.canvas = c;
	
			this.render = function(color) {
				var cxt = this.canvas.getContext("2d");
				cxt.fillStyle = color;
				cxt.fillRect(0,0,150,75);
			};
			
			this.loadImage = function(image) {
				var cxt = this.canvas.getContext("2d");
				cxt.drawImage(image, 0, 0);
			};
			
			this.zoomIn = function() {
				var cxt = this.canvas.getContext("2d");
				cxt.save();
				cxt.scale(2, 2);
				cxt.restore();
				
			};
			
			this.zoomOut = function(scale) {
				var cxt = this.canvas.getContext("2d");
				cxt.scale(-scale, -scale);
			};
		}
	};
}();

$(function(){

	var viewerCanvas = $("#viewer")[0];
	var viewer = new Omnyx.Viewer(viewerCanvas);

	var im = new Image();
	im.onload = function(ev) {
		viewer.loadImage(im);
		viewer.zoomIn();
		viewer.zoomIn();
	};
	im.src = "content/cat.jpg";

});