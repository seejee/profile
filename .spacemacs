;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path
   '(
     "~/.emacs.d/private/"
     )
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     nginx
     php
     sql
     vimscript
     python
     csv
     yaml
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     better-defaults
     colors
     emacs-lisp
     git
     github
     swift
     markdown
     erlang
     elixir
     javascript
     spell-checking
     syntax-checking
     version-control
     shell
     elm
     (ruby :variables
           ruby-enable-enh-ruby-mode f
           ruby-version-manager 'rvm
           ruby-test-runner 'ruby-test
           )
     rust
     osx
     react
     spacemacs-prettier
     org
     java
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(
                                      key-chord
                                      scss-mode
                                      tern-auto-complete
                                      haml-mode
                                      diff-hl
                                      editorconfig
                                      py-autopep8
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark)
   ;;dotspacemacs-themes '(spacemacs-dark
   ;;                      spacemacs-light)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t
   ns-use-native-fullscreen nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin")))
  )

(defun seejee/switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun seejee/run-tests ()
  (interactive)
  (let ((extension (file-name-extension buffer-file-name)))
    (message extension)
    ))

(defun dotspacemacs/user-config ()
  (editorconfig-mode 1)
  ;; Configure git gutter (diff-hl) the way I like it
  (setq diff-hl-side 'left)
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode)
  (set-fringe-style '(8 . 0))

  (set-keyboard-coding-system nil)
  (setq-default git-enable-github-support t)
  (global-evil-surround-mode 1)
  ;;(global-company-mode)
  ;;(add-hook 'alchemist-mode-hook 'company-mode)

  ;; don't prompt for tag tables
  (setq tags-add-tables nil)

  ;;(custom-set-variables
  ;; '(initial-frame-alist (quote ((fullscreen . maximized)))))

  (setq elm-format-on-save t)
  (setq rust-format-on-save t)

  ;; tabs and spaces
  (setq coffee-tab-width 2)
  (setq javascript-indent-level 2)
  (setq js-indent-level 2)
  (setq js2-basic-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq css-indent-offset 2)
  ;;(add-hook 'elm-mode-hook #'turn-off-elm-indent)

  (add-to-list 'auto-mode-alist '("\\.ctl\\'" . ruby-mode))

  ;; don't yell at me about tags
  (setq large-file-warning-threshold 100000000)

  ;; line numbers with a space before the line text
  ;;(global-linum-mode)
  ;;(setq linum-format "%d ")

  ;; Exit insert mode by pressing j and then j quickly
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-mode 1)

  (key-chord-define evil-normal-state-map "ss" 'save-buffer)
  (key-chord-define evil-normal-state-map ",," 'seejee/switch-to-previous-buffer)

  (setq projectile-globally-ignored-directories
        '("solr" "log" "app/assets/bower" "node_modules")
        )

  (setq projectile-globally-ignored-files
        '("TAGS")
        )

  ;; ignore tags in helm ag searches
  ;;(setq helm-ag-use-grep-ignore-list
  ;;      '("TAGS" "log")
  ;;      )

  ;;(setq helm-ag-use-agignore t)
  ;;(setq helm-ag-command-option " -U" )
  (setq js2-strict-missing-semi-warning nil)

  ;; (key-chord-define evil-normal-state-map "gh" 'evil-window-left)
  ;; (key-chord-define evil-normal-state-map "gl" 'evil-window-right)
  ;; (key-chord-define evil-normal-state-map "gk" 'evil-window-up)
  ;; (key-chord-define evil-normal-state-map "gj" 'evil-window-down)
  ;; (keyboard-translate ?\C-h ?\C-w h)
  (define-key global-map (kbd "C-k") 'evil-window-up)
  (define-key global-map (kbd "C-j") 'evil-window-down)

  (evil-search-highlight-persist nil)
  (evil-leader/set-key "ga" 'vc-annotate)

  (setq markdown-open-command "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")
  (evil-leader/set-key "mo" 'markdown-open)

  (key-chord-define evil-normal-state-map ",t" 'ruby-test-run)
  (key-chord-define evil-normal-state-map ",T" 'ruby-test-run-at-point)

  ;; Don't :q quit emacs if you're on the last buffer
  (evil-define-command evil-quit (&optional force)
    "MODIFIED TO ONLY CLOSE WINDOW. Closes the current window, current frame, Emacs.
If the current frame belongs to some client the client connection
is closed."
    :repeat nil
    (interactive "<!>")
    (condition-case nil
        (delete-window)
      (error
       (if (and (boundp 'server-buffer-clients)
                (fboundp 'server-edit)
                (fboundp 'server-buffer-done)
                server-buffer-clients)
           (if force
               (server-buffer-done (current-buffer))
             (server-edit))
         (message "No more windows to remove. Use 'bd' to destroy this buffer")))))

  (evil-ex-define-cmd "q[uit]" 'evil-quit)

  (defun local-to-let ()
    (interactive) (kmacro-exec-ring-item (quote ([108 101 116 40 4 58 19 32 return 2 41 4 4 32 123 4 5 32 63 backspace 125 16 14] 0 "%d")) nil))

  (defun embiggen-steve ()
    (interactive)
    (set-face-attribute 'default nil :height 150))

  (defun not-steve ()
    (interactive)
    (set-face-attribute 'default nil :height 135))

  (global-set-key (kbd "s-e") 'embiggen-steve)
  (global-set-key (kbd "s-E") 'not-steve)

  (setq py-autopep8-options '("--max-line-length=120"))
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'after-init-hook #'global-emojify-mode)

  (require 'ansi-color)
  (defun display-ansi-colors ()
    (interactive)
    (ansi-color-apply-on-region (point-min) (point-max)))

  ;; prettier settings
  (setq prettier-js-args
        '(
          "--trailing-comma" "es5"
          "--single-quote"
          "--tab-width" "4"
          "--print-width" "100"
          ))

  (defun contextual-menubar (&optional frame)
    "Display the menubar in FRAME (default: selected frame) if on a
    graphical display, but hide it if in terminal."
    (interactive)
    (set-frame-parameter frame 'menu-bar-lines
                         (if (display-graphic-p frame)
                             1 0)))

  (add-hook 'after-make-frame-functions 'contextual-menubar)
)


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ns-alternate-modifier (quote (:ordinary meta :function meta :mouse meta)))
 '(package-selected-packages
   (quote
    (nginx-mode phpunit phpcbf php-auto-yasnippets drupal-mode php-mode company-emacs-eclim eclim reformatter treepy graphql org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot py-autopep8 wgrep smex ivy-hydra flyspell-correct-ivy counsel-projectile counsel swiper ivy ghub let-alist sql-indent emojify vimrc-mode dactyl-mode editorconfig winum unfill fuzzy flycheck-credo yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic enh-ruby-mode csv-mode yaml-mode powerline pcre2el spinner ob-elixir org minitest markdown-mode json-snatcher json-reformat hydra parent-mode hide-comnt request gitignore-mode fringe-helper git-gutter+ git-gutter gh marshal logito pcache seq pos-tip flx iedit evil goto-chg highlight f diminish web-completion-data s dash-functional tern rust-mode bind-map bind-key packed company pkg-info epl avy auto-complete popup package-build multiple-cursors anzu undo-tree elixir-mode ht async inf-ruby dash smartparens helm helm-core yasnippet magit-popup git-commit with-editor uuidgen toc-org rake pug-mode osx-dictionary org-plus-contrib org-bullets mwim livid-mode skewer-mode simple-httpd link-hint github-search flyspell-correct-helm flyspell-correct flycheck-mix eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff eshell-z dumb-jump column-enforce-mode color-identifiers-mode cargo sass-mode persp-mode leuven-theme helm-projectile flycheck-rust erlang elm-mode diff-hl flycheck projectile js2-mode magit which-key xterm-color ws-butler window-numbering web-mode web-beautify volatile-highlights vi-tilde-fringe use-package toml-mode tern-auto-complete tagedit swift-mode spacemacs-theme spaceline smooth-scrolling smeargle slim-mode shell-pop scss-mode rvm ruby-tools ruby-test-mode ruby-end rubocop rspec-mode robe reveal-in-osx-finder restart-emacs rbenv rainbow-mode rainbow-identifiers rainbow-delimiters racer quelpa popwin pbcopy paradox page-break-lines osx-trash orgit open-junk-file neotree multi-term move-text mmm-mode markdown-toc magit-gitflow magit-gh-pulls macrostep lorem-ipsum linum-relative less-css-mode launchctl key-chord json-mode js2-refactor js-doc jade-mode info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-mode-manager helm-make helm-gitignore helm-flyspell helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate golden-ratio github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md flycheck-pos-tip flycheck-elm flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu eshell-prompt-extras esh-help emmet-mode elisp-slime-nav define-word company-web company-tern company-statistics company-racer company-quickhelp coffee-mode clean-aindent-mode chruby bundler buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile alchemist aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
