;;; Package --- .emacs
;;; Commentary:
;;; GNU Emacs configuration file

;;; -*- lexical-binding: t; -*-
;;; -*- no-byte-compile: t; -*-

;;; Code:
(require 'ansi-color nil :noerror)
(require 'autoinsert nil :noerror)
(require 'bookmark   nil :noerror)
(require 'bs         nil :noerror)
(require 'cc-mode    nil :noerror)
(require 'cl-indent  nil :noerror)
(require 'cl-lib     nil :noerror)
(require 'comint     nil :noerror)
(require 'compile    nil :noerror)
(require 'dired      nil :noerror)
(require 'dired-x    nil :noerror)
(require 'dirtrack   nil :noerror)
(require 'doc-view   nil :noerror)
(require 'ediff      nil :noerror)
(require 'eldoc      nil :noerror)
(require 'em-smart   nil :noerror)
(require 'eshell     nil :noerror)
(require 'find-dired nil :noerror)
(require 'flyspell   nil :noerror)
(require 'font-lock  nil :noerror)
(require 'ibuffer    nil :noerror)
(require 'ido        nil :noerror)
(require 'image-mode nil :noerror)
(require 'imenu      nil :noerror)
(require 'info       nil :noerror)
(require 'ispell     nil :noerror)
(require 'message    nil :noerror)
(require 'profiler   nil :noerror)
(require 'python     nil :noerror)
(require 'recentf    nil :noerror)
(require 'savehist   nil :noerror)
(require 'saveplace  nil :noerror)
(require 'shell      nil :noerror)
(require 'subr-x     nil :noerror)
(require 'subword    nil :noerror)
(require 'thingatpt  nil :noerror)
(require 'time       nil :noerror)
(require 'tramp      nil :noerror)
(require 'uniquify   nil :noerror)
(require 'url        nil :noerror)
(require 'warnings   nil :noerror)
(require 'wdired     nil :noerror)
(require 'whitespace nil :noerror)
(require 'windmove   nil :noerror)

(defalias 'list-buffers 'ibuffer    )
(defalias 'perl-mode    'cperl-mode )
(defalias 'yes-or-no-p  'y-or-n-p   )

(abbrev-mode                       1 )
(auto-fill-mode                   -1 )
(auto-insert-mode                 -1 )
(column-number-mode                1 )
(delete-selection-mode             1 )
(desktop-save-mode                -1 )
(display-time-mode                 1 )
(eldoc-mode                        1 )
(electric-indent-mode              1 )
(electric-pair-mode               -1 )
(file-name-shadow-mode             1 )
(flyspell-mode                    -1 )
(global-auto-revert-mode           1 )
(global-display-line-numbers-mode -1 )
(global-font-lock-mode             1 )
(global-hl-line-mode              -1 )
(global-prettify-symbols-mode      1 )
(global-so-long-mode               1 )
(global-subword-mode               1 )
(global-visual-line-mode          -1 )
(global-whitespace-mode            1 )
(horizontal-scroll-bar-mode       -1 )
(icomplete-mode                    1 )
(ido-mode                          1 )
(line-number-mode                  1 )
(linum-mode                       -1 )
(menu-bar-mode                    -1 )
(minibuffer-depth-indicate-mode    1 )
(recentf-mode                      1 )
(save-place-mode                   1 )
(savehist-mode                     1 )
(scroll-bar-mode                  -1 )
(show-paren-mode                   1 )
(size-indication-mode              1 )
(subword-mode                      1 )
(tab-bar-mode                     -1 )
(tab-line-mode                    -1 )
(tool-bar-mode                    -1 )
(tooltip-mode                     -1 )
(transient-mark-mode               1 )
(use-hard-newlines                -1 )
(which-function-mode              -1 )
(window-divider-mode              -1 )

(setq-default auto-revert-interval            1    )
(setq-default auto-save-timeout             500    )
(setq-default c-basic-offset                  2    )
(setq-default calendar-week-start-day         1    )
(setq-default display-time-interval           1    )
(setq-default echo-keystrokes                 0.1  )
(setq-default gc-cons-percentage              0.1  )
(setq-default history-length               1000    )
(setq-default kept-new-versions               2    )
(setq-default kept-old-versions               1    )
(setq-default lazy-highlight-initial-delay    0    )
(setq-default lazy-highlight-interval         0    )
(setq-default max-mini-window-height          0.2  )
(setq-default message-log-max              1000    )
(setq-default python-indent                   4    )
(setq-default python-indent-offset            4    )
(setq-default recentf-max-menu-items         10    )
(setq-default recentf-max-saved-items       100    )
(setq-default scroll-conservatively        1000    )
(setq-default scroll-down-aggressively        0.01 )
(setq-default scroll-margin                   1    )
(setq-default scroll-step                     1    )
(setq-default scroll-up-aggressively          0.01 )
(setq-default sh-basic-offset                 2    )
(setq-default show-paren-delay                0    )
(setq-default standard-indent                 2    )
(setq-default tab-width                       2    )
(setq-default whitespace-line-column        100    )

(setq-default apropos-do-all                           t   )
(setq-default auto-revert-avoid-polling                nil )
(setq-default auto-revert-check-vc-info                t   )
(setq-default auto-revert-remote-files                 t   )
(setq-default auto-revert-use-notify                   nil )
(setq-default auto-revert-verbose                      nil )
(setq-default auto-save-default                        t   )
(setq-default auto-window-vscroll                      nil )
(setq-default backup-by-copying                        t   )
(setq-default blink-matching-paren                     t   )
(setq-default bookmark-completion-ignore-case          t   )
(setq-default bookmark-save-flag                       t   )
(setq-default c-mark-wrong-style-of-comment            t   )
(setq-default case-fold-search                         t   )
(setq-default column-number-indicator-zero-based       nil )
(setq-default comint-move-point-for-output             t   )
(setq-default comint-process-echoes                    t   )
(setq-default comint-scroll-to-bottom-on-input         t   )
(setq-default comint-scroll-to-bottom-on-output        t   )
(setq-default compilation-read-command                 t   )
(setq-default compilation-scroll-output                t   )
(setq-default completion-ignore-case                   t   )
(setq-default confirm-kill-emacs                       nil )
(setq-default confirm-kill-processes                   nil )
(setq-default confirm-nonexistent-file-or-buffer       nil )
(setq-default create-lockfiles                         nil )
(setq-default cursor-in-non-selected-windows           nil )
(setq-default custom-safe-themes                       t   )
(setq-default debug-on-error                           nil )
(setq-default debug-on-quit                            nil )
(setq-default delete-auto-save-files                   t   )
(setq-default delete-by-moving-to-trash                t   )
(setq-default delete-old-versions                      t   )
(setq-default delete-trailing-lines                    t   )
(setq-default dired-dwim-target                        t   )
(setq-default dired-hide-details-hide-symlink-targets  nil )
(setq-default dired-ls-F-marks-symlinks                t   )
(setq-default dired-omit-extensions                    nil )
(setq-default dired-omit-mode                          nil )
(setq-default dired-omit-verbose                       nil )
(setq-default display-time-24hr-format                 t   )
(setq-default display-time-day-and-date                nil )
(setq-default display-time-default-load-average        nil )
(setq-default enable-recursive-minibuffers             t   )
(setq-default enable-remote-dir-locals                 t   )
(setq-default eshell-kill-processes-on-exit            t   )
(setq-default eshell-review-quick-commands             nil )
(setq-default eshell-smart-space-goes-to-end           t   )
(setq-default file-name-handler-alist                  nil )
(setq-default find-file-visit-truename                 t   )
(setq-default font-lock-maximum-decoration             t   )
(setq-default frame-inhibit-implied-resize             t   )
(setq-default frame-resize-pixelwise                   t   )
(setq-default gdb-enable-debug                         t   )
(setq-default gdb-many-windows                         nil )
(setq-default gdb-show-changed-values                  t   )
(setq-default gdb-show-main                            t   )
(setq-default gdb-show-threads-by-default              t   )
(setq-default gdb-speedbar-auto-raise                  t   )
(setq-default global-auto-revert-non-file-buffers      t   )
(setq-default history-delete-duplicates                t   )
(setq-default ibuffer-expert                           t   )
(setq-default ibuffer-show-empty-filter-groups         nil )
(setq-default ido-enable-flex-matching                 t   )
(setq-default ido-everywhere                           t   )
(setq-default ido-use-virtual-buffers                  t   )
(setq-default imenu-auto-rescan                        t   )
(setq-default imenu-use-popup-menu                     nil )
(setq-default indent-tabs-mode                         nil )
(setq-default inhibit-compacting-font-caches           t   )
(setq-default inhibit-splash-screen                    t   )
(setq-default inhibit-startup-buffer-menu              t   )
(setq-default inhibit-startup-message                  t   )
(setq-default inhibit-startup-screen                   t   )
(setq-default initial-buffer-choice                    nil )
(setq-default initial-scratch-message                  nil )
(setq-default ispell-dictionary                        nil )
(setq-default ispell-really-aspell                     nil )
(setq-default ispell-really-hunspell                   t   )
(setq-default kill-whole-line                          t   )
(setq-default large-file-warning-threshold             nil )
(setq-default lexical-binding                          t   )
(setq-default line-move-visual                         nil )
(setq-default load-prefer-newer                        t   )
(setq-default make-backup-files                        t   )
(setq-default make-pointer-invisible                   t   )
(setq-default mark-even-if-inactive                    nil )
(setq-default message-log-max                          t   )
(setq-default mouse-drag-copy-region                   nil )
(setq-default mouse-wheel-follow-mouse                 t   )
(setq-default mouse-wheel-progressive-speed            t   )
(setq-default mouse-yank-at-point                      t   )
(setq-default native-comp-async-report-warnings-errors nil )
(setq-default next-line-add-newlines                   nil )
(setq-default package-check-signature                  nil )
(setq-default package-enable-at-startup                nil )
(setq-default package-native-compile                   t   )
(setq-default python-indent-guess-indent-offset        nil )
(setq-default query-replace-highlight                  t   )
(setq-default read-buffer-completion-ignore-case       t   )
(setq-default read-file-name-completion-ignore-case    t   )
(setq-default recenter-redisplay                       nil )
(setq-default require-final-newline                    t   )
(setq-default resize-mini-windows                      nil )
(setq-default save-interprogram-paste-before-kill      t   )
(setq-default save-place-forget-unreadable-files       t   )
(setq-default savehist-save-minibuffer-history         t   )
(setq-default scroll-error-top-bottom                  t   )
(setq-default scroll-preserve-screen-position          t   )
(setq-default search-highlight                         t   )
(setq-default select-enable-clipboard                  t   )
(setq-default select-enable-primary                    nil )
(setq-default sentence-end-double-space                nil )
(setq-default set-mark-command-repeat-pop              t   )
(setq-default shift-select-mode                        nil )
(setq-default show-trailing-whitespace                 t   )
(setq-default split-height-threshold                   nil )
(setq-default split-width-threshold                    nil )
(setq-default system-uses-terminfo                     nil )
(setq-default tags-revert-without-query                t   )
(setq-default track-eol                                t   )
(setq-default truncate-lines                           t   )
(setq-default truncate-partial-width-windows           nil )
(setq-default uniquify-after-kill-buffer-p             t   )
(setq-default use-dialog-box                           nil )
(setq-default use-file-dialog                          nil )
(setq-default vc-follow-symlinks                       t   )
(setq-default vc-make-backup-files                     t   )
(setq-default version-control                          t   )
(setq-default view-read-only                           t   )
(setq-default visible-bell                             t   )
(setq-default warning-suppress-types                   nil )
(setq-default wdired-allow-to-change-permissions       t   )
(setq-default wdired-allow-to-redirect-links           t   )
(setq-default wdired-confirm-overwrite                 t   )
(setq-default wdired-use-dired-vertical-movement       t   )
(setq-default wdired-use-interactive-rename            t   )
(setq-default window-combination-resize                t   )
(setq-default window-divider-default-places            nil )
(setq-default x-frame-normalize-before-maximize        t   )
(setq-default x-stretch-cursor                         t   )
(setq-default yank-pop-change-selection                t   )

(setq-default gc-cons-threshold            (* 10240 10240 ) )
(setq-default large-file-warning-threshold (* 10240 10240 ) )
(setq-default message-log-max              (*  1024  1024 ) )
(setq-default read-process-output-max      (*  1024  1024 ) )
(setq-default undo-limit                   (* 10240 10240 ) )

(setq-default c-default-style          "stroustrup"           )
(setq-default custom-file              "~/.emacs.d/custom.el" )
(setq-default dired-listing-switches   "-a -F -G -h -l"       )
(setq-default explicit-shell-file-name "/bin/bash"            )
(setq-default frame-title-format       "GNU Emacs"            )
(setq-default ispell-dictionary        "en_US"                )
(setq-default shell-file-name          "/bin/bash"            )
(setq-default tramp-default-method     "ssh"                  )
(setq-default uniquify-separator       "::"                   )
(setq-default user-full-name           "Cyberdyne Systems"    )

(setq-default ad-redefinition-action               'accept                          )
(setq-default async-shell-command-buffer           'rename-buffer                   )
(setq-default backup-directory-alist               '( ("." . "~/.emacs.d/backup") ) )
(setq-default backward-delete-char-untabify-method 'hungry                          )
(setq-default browse-url-browser-function          'browse-url-generic              )
(setq-default calendar-date-style                  'european                        )
(setq-default dired-recursive-copies               'always                          )
(setq-default dired-recursive-deletes              'top                             )
(setq-default ediff-window-setup-function          'ediff-setup-windows-plain       )
(setq-default eshell-where-to-jump                 'begin                           )
(setq-default initial-major-mode                   'lisp-interaction-mode           )
(setq-default lisp-indent-function                 'lisp-indent-function            )
(setq-default major-mode                           'text-mode                       )
(setq-default mouse-wheel-scroll-amount            '(1 ((shift) . 1))               )
(setq-default prettify-symbols-unprettify-at-point 'right-edge                      )
(setq-default recenter-positions                   '(middle top bottom)             )
(setq-default ring-bell-function                   'ignore                          )
(setq-default save-abbrevs                         'silently                        )
(setq-default select-active-regions                'only                            )
(setq-default show-paren-style                     'mixed                           )
(setq-default tab-always-indent                    'complete                        )
(setq-default uniquify-buffer-name-style           'forward                         )
(setq-default vc-handled-backends                  '(git svn)                       )
(setq-default whitespace-style                     '(face lines tabs trailing)      )

(defun begin-using-Ibuffer ()
  "Begin using Ibuffer to edit a list of buffers."
  (interactive)
  (split-and-balance-windows )
  (ibuffer                   ) )

(defun customize-C/C++-programming-mode ()
  "Customize C/C++ programming mode."
  (interactive)
  (c-toggle-auto-hungry-state      1 )
  (c-toggle-auto-newline           1 )
  (c-toggle-comment-style         -1 )
  (c-toggle-electric-state         1 )
  (c-toggle-parse-state-debug      1 )
  (c-toggle-syntactic-indentation  1 ) )

(defun ddls ()
  "Delete duplicate lines and sort."
  (interactive)
  (delete-duplicate-lines     (region-beginning) (region-end) )
  (sort-lines             nil (region-beginning) (region-end) ) )

(defun format-buffer-before-saving ()
  "Format buffer before saving."
  (interactive)
  (save-excursion
    (recenter)
    (delete-trailing-whitespace)
    (if (equal major-mode 'makefile-gmake-mode)
        (tabify (point-min) (point-max) )
      (untabify (point-min) (point-max) ) )
    (unless (or (equal major-mode 'fundamental-mode    )
                (equal major-mode 'makefile-gmake-mode )
                (equal major-mode 'python-mode         )
                (equal major-mode 'text-mode           ) )
      (indent-region (point-min) (point-max) ) ) )
  (save-buffer) nil)

(defun insert-an-empty-line-above-the-current-line-and-indent ()
  "Insert an empty line above the current line and indent."
  (interactive)
  (end-of-line        0 )
  (open-line          0 )
  (newline-and-indent   ) )

(defun kill-all-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (delete-other-windows)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list) ) )
  (message "All other buffers was killed!") )

(defun exec-scheme ()
  "Run an inferior Scheme process."
  (interactive)
  (autoload 'run-scheme  "cmuscheme" "Run an inferior Scheme" t )
  (autoload 'scheme-mode "cmuscheme" "Major mode for Scheme"  t )
  (cond ( (executable-find "scheme" )
          (save-selected-window (run-scheme (executable-find "scheme" ) ) ) )
        ( (executable-find "guile"  )
          (save-selected-window (run-scheme (executable-find "guile"  ) ) ) ) ) )

(defun signal-an-error-if-variable-is-obsolete ()
  "Signal an error if variable is obsolete."
  (interactive)
  (defvar variable-doc-string)
  (setq variable-doc-string (describe-variable (symbol-at-point) ) )
  (if  (string-match "obsolete" variable-doc-string)
      (error "This variable is obsolete")
    (message "The test is passed successfully") ) )

(defun split-and-balance-windows ()
  "Split and balance windows."
  (interactive)
  (split-window-sensibly   )
  (other-window          1 )
  (balance-windows         ) )

(add-hook 'makefile-mode-hook
          '(lambda () (setq-default indent-tabs-mode t) ) )
(add-hook 'c-mode-common-hook 'customize-C/C++-programming-mode)

(prefer-coding-system       'utf-8  )
(set-default-coding-systems 'utf-8  )
(set-language-environment   "UTF-8" )
(setq-default default-input-method "russian-computer")

(cond
 ( (executable-find "ipython" )
   (setq-default python-shell-interpreter (executable-find "ipython") )
   (setq-default python-shell-interpreter-args "--simple-prompt -i" ) )
 ( (executable-find "python"  )
   (setq-default python-shell-interpreter (executable-find "python" ) )
   (setq-default python-shell-interpreter-args "-i"                 ) ) )

(add-hook 'prog-mode-hook
          (lambda () (setq-default display-line-numbers 'visual) ) )

(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines)
  (setq-default indicate-empty-lines t) )

(if (file-exists-p bookmark-default-file)
    (bookmark-load bookmark-default-file t) )

(defun run-an-inferior-Octave-process ()
  "Run an inferior Octave process."
  (interactive)
  (save-selected-window (run-octave nil) ) )
(when (executable-find "octave")
  (add-hook    'octave-mode-hook 'run-an-inferior-Octave-process )
  (add-to-list 'auto-mode-alist  '("\\.m$" . octave-mode)        ) )

(add-hook 'scheme-mode-hook 'exec-scheme)

(setq-default browse-url-generic-program
              (cond ( (executable-find "firefox"       ) (executable-find "firefox"       ) )
                    ( (executable-find "google-chrome" ) (executable-find "google-chrome" ) ) ) )

(when (display-graphic-p)
  (blink-cursor-mode )
  (display-time      )
  (fringe-mode       )
  (setq-default cursor-type 'box)
  (add-to-list 'default-frame-alist '(height .  40) )
  (add-to-list 'default-frame-alist '(width  . 120) )
  (cond ( (member "Cascadia Code"       (font-family-list) )
          (set-frame-font "Cascadia Code 18"       t t ) )
        ( (member "Fantasque Sans Mono" (font-family-list) )
          (set-frame-font "Fantasque Sans Mono 18" t t ) )
        ( (member "JetBrains Mono"      (font-family-list) )
          (set-frame-font "JetBrains Mono 16"      t t ) )
        ( (member "DejaVu Sans Mono"    (font-family-list) )
          (set-frame-font "DejaVu Sans Mono 14"    t t ) ) )
  (setq-default indicate-buffer-boundaries '( ( bottom . left )
                                              ( down   . left )
                                              ( top    . left )
                                              ( up     . left )
                                              ( t      . left ) ) )
  (set-frame-parameter (selected-frame) (quote  alpha) (quote (95 . 95) ) )
  (add-to-list 'default-frame-alist     (quote (alpha    .    (95 . 95) ) ) ) )

(global-set-key (kbd "<f1>"  ) 'apropos                     )
(global-set-key (kbd "<f2>"  ) 'begin-using-Ibuffer         )
(global-set-key (kbd "<f3>"  ) 'comment-line                )
(global-set-key (kbd "<f4>"  ) 'bookmark-set                )
(global-set-key (kbd "<f5>"  ) 'bookmark-jump               )
(global-set-key (kbd "<f6>"  ) 'bookmark-bmenu-list         )
(global-set-key (kbd "<f7>"  ) 'ispell-comments-and-strings )
(global-set-key (kbd "<f8>"  ) 'kmacro-start-macro          )
(global-set-key (kbd "<f9>"  ) 'kmacro-end-macro            )
(global-set-key (kbd "<f10>" ) 'kmacro-call-macro           )
(global-set-key (kbd "<f11>" ) 'toggle-frame-fullscreen     )
(global-set-key (kbd "<f12>" ) 'kill-all-other-buffers      )

(windmove-default-keybindings 'shift)

(global-unset-key (kbd "<deletechar>" ) )
(global-unset-key (kbd "<end>"        ) )
(global-unset-key (kbd "<home>"       ) )
(global-unset-key (kbd "<insert>"     ) )
(global-unset-key (kbd "<next>"       ) )
(global-unset-key (kbd "<prior>"      ) )
(global-unset-key [down               ] )
(global-unset-key [left               ] )
(global-unset-key [right              ] )
(global-unset-key [up                 ] )

(global-set-key (kbd "<escape>"    ) 'keyboard-escape-quit                                   )
(global-set-key (kbd "C-<return>"  ) 'insert-an-empty-line-above-the-current-line-and-indent )
(global-set-key (kbd "C-c C-f"     ) 'recentf-open-files                                     )
(global-set-key (kbd "C-x C-d"     ) 'dired                                                  )
(global-set-key (kbd "C-x C-s"     ) 'format-buffer-before-saving                            )
(global-set-key (kbd "S-C-<down>"  ) 'shrink-window                                          )
(global-set-key (kbd "S-C-<left>"  ) 'shrink-window-horizontally                             )
(global-set-key (kbd "S-C-<right>" ) 'enlarge-window-horizontally                            )
(global-set-key (kbd "S-C-<up>"    ) 'enlarge-window                                         )

(require 'package nil :noerror)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/" ) t )
(add-to-list 'package-archives '("org"   . "https://orgmode.org/elpa/"   ) t )
(package-initialize)
(unless package-archive-contents (ignore-errors (package-refresh-contents) ) )

(unless (package-installed-p 'use-package)
  (package-install 'use-package) )
(when (require 'use-package nil :noerror)
  (setq-default use-package-always-ensure t   )
  (setq-default use-package-verbose       nil ) )

(use-package ace-window
  :bind ("M-o" . ace-window) )

(use-package all-the-icons
  :if (not (string-equal system-type "windows-nt") ) )

(use-package all-the-icons-dired
  :after all-the-icons
  :hook (dired-mode . all-the-icons-dired-mode)
  :if (not (string-equal system-type "windows-nt") ) )

(use-package anzu
  :init (global-anzu-mode) )

(use-package avy
  :bind
  ( ("M-g c" . avy-goto-char   )
    ("M-g l" . avy-goto-line   )
    ("M-g w" . avy-goto-word-1 ) )
  :init
  (setq-default avy-all-windows nil )
  (setq-default avy-background  t   ) )

(use-package cider
  :config
  (setq-default cider-repl-display-help-banner       nil          )
  (setq-default cider-repl-pop-to-buffer-on-connect 'display-only )
  :hook (clojure-mode . cider-mode)
  :if (executable-find "clojure") )

(use-package clojure-mode
  :hook (clojure-mode . smartparens-strict-mode)
  :if (executable-find "clojure") )

(use-package clojure-mode-extra-font-locking
  :after clojure-mode
  :if (executable-find "clojure") )

(use-package cmake-mode
  :if (executable-find "cmake") )

(use-package cmake-font-lock
  :after cmake-mode
  :config (autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
  :hook (cmake-mode . cmake-font-lock-activate)
  :if (executable-find "cmake") )

(use-package company
  :bind
  ( :map company-active-map
         ("<tab>" . company-complete        )
         ("C-d"   . company-show-doc-buffer )
         ("C-n"   . company-select-next     )
         ("C-p"   . company-select-previous ) )
  :hook (prog-mode . company-mode)
  :init
  (setq-default company-idle-delay            0 )
  (setq-default company-selection-wrap-around t )
  (setq-default company-tooltip-limit         5 ) )

(use-package counsel
  :bind
  ( ("<f1>"    . counsel-apropos   )
    ("C-x C-f" . counsel-find-file )
    ("M-x"     . counsel-M-x       ) )
  :init
  (ido-mode     -1 )
  (counsel-mode    ) )

(use-package counsel-projectile
  :after (counsel projectile)
  :config (counsel-projectile-mode) )

(use-package doom-themes
  :if window-system
  :init
  (doom-themes-org-config         )
  (doom-themes-visual-bell-config )
  (setq-default doom-themes-enable-bold   t     )
  (setq-default doom-themes-enable-italic t     )
  (load-theme 'doom-horizon               t nil ) )

(use-package doom-modeline
  :config (setq-default doom-modeline-height 37)
  :init (doom-modeline-mode) )

(use-package dashboard
  :config
  (dashboard-setup-startup-hook               )
  (setq-default dashboard-set-file-icons    t )
  (setq-default dashboard-set-heading-icons t ) )

(use-package expand-region
  :bind ("C-=" . er/expand-region) )

(use-package flycheck
  :init (global-flycheck-mode) )

(use-package gnuplot
  :config
  (autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot-mode" t )
  (autoload 'gnuplot-mode        "gnuplot" "Gnuplot major mode"            t )
  :if (executable-find "gnuplot")
  :mode ("\\.gp\\'" . gnuplot-mode) )

(use-package hl-todo
  :init (global-hl-todo-mode) )

(use-package iedit)

(use-package ivy
  :init
  (ivy-mode)
  (setq-default ivy-initial-inputs-alist  nil )
  (setq-default ivy-use-selectable-prompt t   )
  (setq-default ivy-use-virtual-buffers   t   )
  (setq-default ivy-wrap                  t   ) )

(use-package lsp-mode
  :bind
  ( :map lsp-mode-map
         ("M-<return>" . lsp-rename) )
  :config
  (setq-default lsp-auto-guess-root              t   )
  (setq-default lsp-eldoc-render-all             t   )
  (setq-default lsp-enable-symbol-highlighting   nil )
  (setq-default lsp-headerline-breadcrumb-enable nil )
  (setq-default lsp-lens-enable                  t   )
  :init
  (setq-default lsp-clients-clangd-args '( "--background-index"
                                           "--clang-tidy"
                                           "--cross-file-rename"
                                           "--log=error"
                                           "--pch-storage=memory"
                                           "--pretty"
                                           "-j=4"                 ) )
  (setq-default lsp-keymap-prefix          "C-c l"                  )
  :hook
  ( (bibtex-mode        . lsp                              )
    (c++-mode           . lsp                              )
    (c-mode             . lsp                              )
    (clojure-mode       . lsp                              )
    (clojurec-mode      . lsp                              )
    (clojurescript-mode . lsp                              )
    (latex-mode         . lsp                              )
    (lsp-mode           . lsp-enable-which-key-integration )
    (rustic-mode        . lsp                              )
    (tex-mode           . lsp                              )
    (tuareg-mode        . lsp                              ) )
  :if
  (or (executable-find "clangd"      )
      (executable-find "clojure-lsp" )
      (executable-find "ocamllsp"    )
      (executable-find "rls"         )
      (executable-find "texlab"      ) ) )

(use-package magit
  :bind ("C-x g" . magit-status)
  :if (executable-find "git") )

(use-package markdown-mode
  :config
  (setq-default markdown-enable-math                  t )
  (setq-default markdown-fontify-code-blocks-natively t )
  :if (executable-find "markdown") )

(use-package modern-cpp-font-lock
  :config (modern-c++-font-lock-global-mode) )

(use-package ocamlformat
  :custom (ocamlformat-enable 'enable-outside-detected-project)
  :hook (before-save . ocamlformat-before-save)
  :if (executable-find "ocamlformat") )

(use-package tuareg
  :if (executable-find "ocaml") )

(use-package utop
  :config (setq-default utop-command "opam config exec -- dune utop . -- -emacs")
  :hook (tuareg-mode . utop-minor-mode)
  :init
  (autoload 'utop            "utop" "Toplevel for OCaml"  t )
  (autoload 'utop-minor-mode "utop" "Minor mode for utop" t )
  :if (executable-find "utop") )

(use-package org
  :config
  (require 'ob         nil :noerror )
  (require 'ob-clojure nil :noerror )
  (require 'org-tempo  nil :noerror )
  (require 'ox-latex   nil :noerror )
  (org-babel-do-load-languages 'org-babel-load-languages
                               '( ( awk        . t )
                                  ( clojure    . t )
                                  ( emacs-lisp . t )
                                  ( gnuplot    . t )
                                  ( lisp       . t )
                                  ( makefile   . t )
                                  ( octave     . t )
                                  ( perl       . t )
                                  ( python     . t )
                                  ( scheme     . t )
                                  ( sed        . t )
                                  ( shell      . t ) ) )
  (setq-default org-babel-clojure-backend                   'cider            )
  (setq-default org-checkbox-hierarchical-statistics         nil              )
  (setq-default org-confirm-babel-evaluate                   nil              )
  (setq-default org-fontify-done-headline                    t                )
  (setq-default org-fontify-quote-and-verse-blocks           t                )
  (setq-default org-fontify-whole-heading-line               t                )
  (setq-default org-hide-emphasis-markers                    t                )
  (setq-default org-outline-path-complete-in-steps           nil              )
  (setq-default org-refile-use-outline-path                  t                )
  (setq-default org-return-follows-link                      t                )
  (setq-default org-src-ask-before-returning-to-edit-buffer  nil              )
  (setq-default org-src-preserve-indentation                 t                )
  (setq-default org-src-tab-acts-natively                    t                )
  (setq-default org-src-window-setup                        'reorganize-frame )
  (setq-default org-startup-folded                           nil              )
  (setq-default org-startup-indented                         t                )
  :ensure org-plus-contrib)

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode) )

(use-package projectile
  :after ivy
  :bind
  ( :map projectile-mode-map
         ("C-c p" . projectile-command-map) )
  :config
  (setq-default projectile-completion-system 'ivy             )
  (setq-default projectile-indexing-method   'native          )
  (setq-default projectile-sort-order        'recently-active )
  :if (executable-find "git")
  :init (projectile-mode) )

(use-package racket-mode
  :hook
  ( (racket-mode      . racket-unicode-input-method-enable )
    (racket-repl-mode . racket-unicode-input-method-enable ) )
  :if (executable-find "racket")
  :mode "\\.rkt\\'")

(use-package rustic
  :config
  (setq-default lsp-rust-analyzer-server-display-inlay-hints t )
  (setq-default rustic-format-on-save                        t )
  :if (executable-find "rustup") )

(use-package slime
  :config
  (require 'slime-autoloads nil :noerror)
  (setq-default common-lisp-style-default "sbcl" )
  (setq-default inferior-lisp-program     "sbcl" )
  (slime-setup '(slime-asdf slime-fancy slime-tramp slime-indentation) )
  :if (executable-find "sbcl") )

(use-package smartparens
  :hook (prog-mode . smartparens-mode) )

(use-package swiper
  :bind ("C-s" . swiper)
  :init (setq-default swiper-action-recenter t) )

(use-package vterm
  :if (not (string-equal system-type "windows-nt") )
  :init (setq-default vterm-always-compile-module t) )

(use-package web-mode)

(use-package which-key
  :init
  (which-key-mode                     )
  (which-key-setup-minibuffer         )
  (which-key-setup-side-window-bottom ) )

(use-package yasnippet
  :init (yas-global-mode) )

(use-package yasnippet-snippets
  :after yasnippet)

(provide '.emacs)
;;; .emacs ends here
