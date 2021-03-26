;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jonnas Li"
      user-mail-address "lzs09@hotmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Iosevka Term SS04" :size 14 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Iosevka Aile" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; ;; Use Proportional Fonts
;; (defun my-buffer-face-mode-variable ()
;;   "Set font to a variable width (proportional) fonts in current buffer"
;;   (interactive)
;;   (setq buffer-face-mode-face '(:family "Iosevka Term SS04" :height 100 ))
;;   (buffer-face-mode))
;; (add-hook 'org-mode-hook 'my-buffer-face-mode-variable)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; (defun doom-modeline-conditional-buffer-encoding ()
;;   "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
;;   (setq-local doom-modeline-buffer-encoding
;;               (unless (and (memq (plist-get (coding-system-plist buffer-file-coding-system) :category)
;;                                  '(coding-category-undecided coding-category-utf-8))
;;                            (not (memq (coding-system-eol-type buffer-file-coding-system) '(1 2))))
;;                 t)))

;; (add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)


(setq-default
 history-length 1000
 prescient-history-length 1000
 delete-by-moving-to-trash t                                    ; Delete files to trash
 tab-width 4                                                    ; Set width for tabs
 uniquify-buffer-name-style 'forward                            ; Uniquify buffer names
 window-combination-resize t                                    ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                                            ; Stretch cursor to the glyph width

(setq-default history-length 1000) ; remembering history from precedent
(setq-default prescient-history-length 1000)

(setq undo-limit 80000000                                       ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                                     ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                                       ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…")                             ; Unicode ellispis are nicer than "...", and also save /precious/ space

(delete-selection-mode 1)                                       ; Replace selection when inserting text
(global-subword-mode 1)                                         ; Iterate through CamelCase words
;; (setq line-spacing 0.01)                                         ; seems like a nice line spacing balance.

;; Battery Display
(if (equal "Battery status not available"
           (battery))
    (display-battery-mode 1)                                    ; On laptops it's nice to know how much power you have
  (setq password-cache-expiry nil))                             ; I can trust my desktops ... can't I? (no battery = desktop)

;; Windows Behavior
;; (setq evil-vsplit-window-right t
      ;; evil-split-window-below t)
;; (defadvice! prompt-for-buffer (&rest _)
  ;; :after '(evil-window-split evil-window-vsplit)
  ;; (+ivy/switch-buffer))
;; (setq +ivy-buffer-preview t)

;; Modeline
;; (defun doom-modeline-conditional-buffer-encoding ()
;;   (setq-local doom-modeline-buffer-encoding
;;               (unless (or (eq buffer-file-coding-system 'utf-8-unix)
;;                           (eq buffer-file-coding-system 'utf-8)))))
;; (add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)
;; Windows Layout
;; (map! :map evil-window-map
;;       "SPC" #'rotate-layout
;;       "<left>"     #'evil-window-left
;;        "<down>"     #'evil-window-down
;;        "<up>"       #'evil-window-up
;;        "<right>"    #'evil-window-right
;;        ;; Swapping windows
;;        "C-<left>"       #'+evil/window-move-left
;;        "C-<down>"       #'+evil/window-move-down
;;        "C-<up>"         #'+evil/window-move-up
;;        "C-<right>"      #'+evil/window-move-right)

;; Windows Title
;; (setq frame-title-format
;;       '(""
;;         (:eval
;;          (if (s-contains-p org-roam-directory (or buffer-file-name ""))
;;              (replace-regexp-in-string
;;               ".*/[0-9]*-?" "☰ "
;;               (subst-char-in-string ?_ ?  buffer-file-name))
;;            "%b"))
;;         (:eval
;;          (let ((project-name (projectile-project-name)))
;;            (unless (string= "-" project-name)
;;              (format (if (buffer-modified-p)  " ◉ %s" "  ●  %s") project-name))))))

;; ;; Company
;; (after! company
;;   (setq company-idle-delay 0.5
;;         company-minimum-prefix-length 2)
;;   (setq company-show-numbers t)
;; (add-hook 'evil-normal-state-entry-hook #'company-abort)) ;; make aborting less annoying.

;; Enable logging of done tasks
(after! org
  (setq org-log-done t)
  (setq org-log-into-drawer t))

;; ;; Org GTD
;; (use-package! org-gtd
;;   :after org
;;   :config
;;   ;; where org-gtd will put its files. This value is also the default one.
;;   (setq org-gtd-directory "~/org/")
;;   ;; package: https://github.com/Malabarba/org-agenda-property
;;   ;; this is so you can see who an item was delegated to in the agenda
;;   ;; (setq org-agenda-property-list '("DELEGATED_TO"))
;;   ;; I think this makes the agenda easier to read
;;   ;; (setq org-agenda-property-position 'next-line)
;;   ;; package: https://www.nongnu.org/org-edna-el/
;;   ;; org-edna is used to make sure that when a project task gets DONE,
;;   ;; the next TODO is automatically changed to NEXT.
;;   (setq org-edna-use-inheritance t)
;;   ;; (org-edna-load)
;;   :bind
;;   (("C-c d c" . org-gtd-capture) ;; add item to inbox
;;    ("C-c d a" . org-agenda-list) ;; see what's on your plate today
;;    ("C-c d p" . org-gtd-process-inbox) ;; process entire inbox
;;    ("C-c d n" . org-gtd-show-all-next) ;; see all NEXT items
;;    ;; see projects that don't have a NEXT item
;;    ("C-c d s" . org-gtd-show-stuck-projects)
;;    ;; the keybinding to hit when you're done editing an item in the
;;    ;; processing phase
;;    ("C-c d f" . org-gtd-clarify-finalize)))

;; ;; GTD Items
;; (after! (org-gtd org-capture)
;;   (add-to-list 'org-capture-templates
;;                '("i" "GTD item"
;;                  entry
;;                  (file (lambda () (org-gtd--path org-gtd-inbox-file-basename)))
;;                  "* %?\n%U\n\n  %i"
;;                  :kill-buffer t))
;;   (add-to-list 'org-capture-templates
;;                '("l" "GTD item with link to where you are in emacs now"
;;                  entry
;;                  (file (lambda () (org-gtd--path org-gtd-inbox-file-basename)))
;;                  "* %?\n%U\n\n  %i\n  %a"
;;                  :kill-buffer t))
;;   (add-to-list 'org-capture-templates
;;                '("m" "GTD item with link to current Outlook mail message"
;;                  entry
;;                  (file (lambda () (org-gtd--path org-gtd-inbox-file-basename)))
;;                  "* %?\n%U\n\n  %i\n  %(org-mac-outlook-message-get-links)"
;;                  :kill-buffer t)))
;; (defadvice! +zz/load-org-gtd-before-capture (&optional goto keys)
;;     :before #'org-capture
;;     (require 'org-capture)
;;     (require 'org-gtd))
(after! org
  (setq org-todo-keywords
     '((sequence
           "TODO(t)"  ; A task that needs doing & is ready to do
           "PROJ(p)"  ; An ongoing project that cannot be completed in one step
           "INPROCESS(s)"  ; A task that is in progress
           "⚑ WAITING(w)"  ; Something is holding up this task; or it is paused
           "|"
           "☟ NEXT(n)"
           "✰ IMPORTANT(i)"
           "DONE(d)"  ; Task successfully completed
           "✘ CANCELED(c@)") ; Task was cancelled, aborted or is no longer applicable
          (sequence
           "✍ NOTE(N)"
           "FIXME(f)"
           "☕ BREAK(b)"
           "❤ LOVE(l)"
           "REVIEW(r)"
           )) ; Task was completed
        org-todo-keyword-faces
        '(
          ("TODO" . (:foreground "#ff39a3" :weight bold))
          ("INPROCESS"  . "orangered")
          ("✘ CANCELED" . (:foreground "white" :background "#4d4d4d" :weight bold))
          ("⚑ WAITING" . "pink")
          ("☕ BREAK" . "gray")
          ("❤ LOVE" . (:foreground "VioletRed4"
                                   ;; :background "#7A586A"
                                   :weight bold))
          ("☟ NEXT" . (:foreground "DeepSkyBlue"
                                   ;; :background "#7A586A"
                                      :weight bold))
          ("✰ IMPORTANT" . (:foreground "greenyellow"
                                      ;; :background "#7A586A"
                                      :weight bold))
          ("DONE" . "#008080")
          ("FIXME" . "IndianRed")
          )))

(defun org-hugo-new-subtree-post-capture-template ()
  "Returns `org-capture' template string for new Hugo post.
See `org-capture-templates' for more information."
  (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
         (fname (org-hugo-slug title)))
    (mapconcat #'identity
               `(
                 ,(concat "* TODO " title)
                 ":PROPERTIES:"
                 ,(concat ":EXPORT_HUGO_BUNDLE: " fname)
                 ":EXPORT_FILE_NAME: index"
                 ":END:"
                 "%?\n")                ;Place the cursor here finally
               "\n")))

(after! org
  (add-to-list 'org-capture-templates
             '("h"                ;`org-capture' binding + h
               "Hugo post"
               entry
               ;; It is assumed that below file is present in `org-directory'
               ;; and that it has a "Blog Ideas" heading. It can even be a
               ;; symlink pointing to the actual location of all-posts.org!
               (file+headline "~/posts.org" "Inbox")
               ;;(file+olp "/home/burgess/Documents/Org/posts.org" "blog")
               (function org-hugo-new-subtree-post-capture-template))))
;; Org visual settings
;; (add-hook! org-mode :append
           ;; #'visual-line-mode
           ;; #'variable-pitch-mode)

;; Org Bullets
;; (use-package! org
;;   :config
;;   (setq
;;   ; org-bullets-bullet-list '("⁖")
;;    org-todo-keyword-faces
;;    '(("TODO" :foreground "#7c7c75" :weight normal :underline t)
;;      ("WAITING" :foreground "#9f7efe" :weight normal :underline t)
;;      ("INPROGRESS" :foreground "#0098dd" :weight normal :underline t)
;;      ("DONE" :foreground "#50a14f" :weight normal :underline t)
;;      ("CANCELLED" :foreground "#ff6480" :weight normal :underline t))
;;    ;; org-priority-faces '((65 :foreground "#e45649")
;;    ;;                      (66 :foreground "#da8548")
;;    ;;                      (67 :foreground "#0098dd"))
;;    ))

;; Org Fancy Priorities
(use-package! org-fancy-priorities
  ;; :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
   (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))

;; ;; Org-Roam settings
(setq org-roam-directory "~/org/roam")
(after! org-roam
        (map! :leader
            :prefix "n"
            :desc "org-roam" "l" #'org-roam
            :desc "org-roam-insert" "i" #'org-roam-insert
            :desc "org-roam-switch-to-buffer" "b" #'org-roam-switch-to-buffer
            :desc "org-roam-find-file" "f" #'org-roam-find-file
            :desc "org-roam-show-graph" "g" #'org-roam-show-graph
            :desc "org-roam-capture" "c" #'org-roam-capture))
(after! org-roam
      (setq org-roam-ref-capture-templates
            '(("r" "ref" plain (function org-roam-capture--get-point)
               "%?"
               :file-name "websites/${slug}"
               :head "#+TITLE: ${title}
    #+ROAM_KEY: ${ref}
    - source :: ${ref}"
               :unnarrowed t))))  ; capture template to grab websites. Requires org-roam protocol.

;; ;; Org Journal
;; (use-package org-journal
;;   :init
;;   (setq org-journal-dir "~/org/journals/"
;;         org-journal-date-prefix "#+TITLE: "
;;         org-journal-file-format "%Y-%m-%d.org"
;;         org-journal-date-format "%A, %d %B %Y")
;;   :config
;;   (setq org-journal-find-file #'find-file-other-window )
;;   (map! :map org-journal-mode-map
;;         "C-c n s" #'evil-save-modified-and-close )
;;   )

;; (setq org-journal-enable-agenda-integration t)


;; ;; Org Roam Server
;; (use-package! org-roam-server
;;   :after org-roam
;;   :config
;;   (setq org-roam-server-host "127.0.0.1"
;;         org-roam-server-port 8080
;;         org-roam-server-export-inline-images t
;;         org-roam-server-authenticate nil
;;         org-roam-server-label-truncate t
;;         org-roam-server-label-truncate-length 60
;;         org-roam-server-label-wrap-length 20)
;;   (defun org-roam-server-open ()
;;     "Ensure the server is active, then open the roam graph."
;;     (interactive)
;;     (org-roam-server-mode 1)
;;     (browse-url-xdg-open (format "http://localhost:%d" org-roam-server-port))))
;; (after! org-roam
;;   (org-roam-server-mode))

;; ;; Org-Download
(use-package! org-download
  :after org
  :bind
  (:map org-mode-map
        (("s-Y" . org-download-screenshot)
         ("s-y" . org-download-yank))))

;; ;; Org Super Agenda
(use-package! org-super-agenda
  :commands (org-super-agenda-mode))
(after! org-agenda
  (org-super-agenda-mode))

(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator nil
      org-agenda-tags-column 100 ;; from testing this seems to be a good value
      org-agenda-compact-blocks t)
;; (setq org-agenda-files "~/org/")
(setq org-agenda-custom-commands
      '(("o" "Overview"
         ((agenda "" ((org-agenda-span 'day)
                      (org-super-agenda-groups
                       '((:name "Today"
                          :time-grid t
                          :date today
                          :todo "TODAY"
                          :scheduled today
                          :order 1)))))
          (alltodo "" ((org-agenda-overriding-header "")
                       (org-super-agenda-groups
                        '((:name "Next to do"
                           :todo "NEXT"
                           :order 1)
                          (:name "Important"
                           :tag "Important"
                           :priority "A"
                           :order 1)
                          (:name "Due Today"
                           :deadline today
                           :order 2)
                          (:name "Due Soon"
                           :deadline future
                           :order 8)
                          (:name "Overdue"
                           :deadline past
                           :face error
                           :order 7)
                          (:name "Work"
                           :tag  "Work"
                           :order 3)
                          ;; (:name "Dissertation"
                          ;;  :tag "Dissertation"
                          ;;  :order 7)
                          (:name "Emacs"
                           :tag "Emacs"
                           :order 13)
                          (:name "Projects"
                           :tag "Project"
                           :order 14)
                          ;; (:name "Essay 1"
                          ;;  :tag "Essay1"
                          ;;  :order 2)
                          (:name "Reading List"
                           :tag "Read"
                           :order 8)
                          (:name "Work In Progress"
                           :tag "WIP"
                           :order 5)
                          (:name "Blog"
                           :tag "Blog"
                           :order 12)
                          (:name "Trivial"
                           :priority<= "E"
                           :tag ("Trivial" "Unimportant")
                           :todo ("SOMEDAY" )
                           :order 90)
                          (:discard (:tag ("Chore" "Routine" "Daily")))))))))))

;; ;; Deft
;; ;; (use-package! deft
;; ;;       :after org
;; ;;       :bind
;; ;;       ("C-c n d" . deft)
;; ;;       :custom
;; ;;       (deft-recursive t)
;; ;;       (deft-use-filter-string-for-filename t)
;; ;;       (deft-default-extension "org")
;; ;;       (deft-directory "~/org/roam/"))

;; ;; Keycast
(use-package! keycast
  :commands keycast-mode
  :config
  (define-minor-mode keycast-mode
    "Show current command and its key binding in the mode line."
    :global t
    (if keycast-mode
        (progn
          (add-hook 'pre-command-hook 'keycast--update t)
          (add-to-list 'global-mode-string '("" mode-line-keycast " ")))
      (remove-hook 'pre-command-hook 'keycast--update)
      (setq global-mode-string (remove '("" mode-line-keycast " ") global-mode-string))))
  (custom-set-faces!
    '(keycast-command :inherit doom-modeline-debug
                      :height 0.9)
    '(keycast-key :inherit custom-modified
                  :height 1.1
                  :weight bold)))

;; Screencast
(use-package! gif-screencast
  :commands gif-screencast-mode
  :config
  (map! :map gif-screencast-mode-map
        :g "<f8>" #'gif-screencast-toggle-pause
        :g "<f9>" #'gif-screencast-stop)
  (setq gif-screencast-program "maim"
        gif-screencast-args `("--quality" "3" "-i" ,(string-trim-right
                                                     (shell-command-to-string
                                                      "xdotool getactivewindow")))
        gif-screencast-optimize-args '("--batch" "--optimize=3" "--usecolormap=/tmp/doom-color-theme"))
  (defun gif-screencast-write-colormap ()
    (f-write-text
     (replace-regexp-in-string
      "\n+" "\n"
      (mapconcat (lambda (c) (if (listp (cdr c))
                                 (cadr c))) doom-themes--colors "\n"))
     'utf-8
     "/tmp/doom-color-theme" ))
  (gif-screencast-write-colormap)
  (add-hook 'doom-load-theme-hook #'gif-screencast-write-colormap))

(use-package! vlf-setup
  :defer-incrementally vlf-tune vlf-base vlf-write vlf-search vlf-occur vlf-follow vlf-ediff vlf)

(use-package! pangu-spacing
  :config
  (global-pangu-spacing-mode 1)
  ;; only insert real whitespace in some specific mode, but just add virtual space in other mode
  (add-hook 'org-mode-hook
            '(lambda ()
               (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)))
  )

;; Find Key Bindings
(use-package! visual-regexp-steroids
  :defer 3
  :config
  (require 'pcre2el)
  (setq vr/engine 'pcre2el)
  (map! "C-c s r" #'vr/replace)
  (map! "C-c s q" #'vr/query-replace))

(after! undo-fu
  (map! :map undo-fu-mode-map "C-?" #'undo-fu-only-redo))
