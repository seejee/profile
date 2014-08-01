;; set GC threshold to 20MB
(setq gc-cons-threshold 20000000)

;; backup files
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(load "~/.emacs.d/gui.el")
(load "~/.emacs.d/custom.el")
(load "~/.emacs.d/el-get.el")
