(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(menu-bar-mode t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 ;; ;; '(org-journal-date-format "%A, %Y-%m-%d" t)
 ;; '(org-journal-date-prefix "#+TITLE: " t)
 ;; '(org-journal-dir "~/org/journals/" t)
 ;; '(org-journal-file-format "%Y-%m-%d.org" t)
 ;; '(package-selected-packages (quote (org-fancy-priorities)))
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-buffer-modified ((t (:foreground "orange"))))
 '(doom-modeline-evil-insert-state ((t (:weight bold :foreground "#339CDB"))))
 )

(setq vterm-module-cmake-args "-DUSE_SYSTEM_LIBVTERM=yes")

;; adding custom key-bindings for most used functions
;; (map! :leader "f a"#'helm-bibtex)  ; "find article" : opens up helm bibtex for search.
;; (map! :leader "o n"#'org-noter)    ; "org noter"  : opens up org noter in a headline
;; (map! :leader "r c i"#'org-clock-in); "routine clock in" : clock in to a habit.
;; (map! :leader "c b"#'beacon-blink) ; "cursor blink" : makes the beacon-blink

;; (set! :popup "^\\*capture"
;;       '((slot . -1)
;;         (side . right)
;;         (size . 80))
;;       '((modeline . nil)
;;         (select . t))
      ;; )

;; (after! org
  ;; (set-popup-rule! "Capture" :side 'right :size .30 :select t))
;; (after! org
  ;; (set-popup-rule! "^\\*Capture*" '((slot . -1) (side . right) (size . 80)) '((modeline . nil) (select . t)))
  ;; )
