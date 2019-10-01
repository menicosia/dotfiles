;;;
;;; Add ~/.site-lisp to load path
(setq load-path (append (list "~/.site-lisp") load-path))
;;;
(require 'php-mode)
;;;
(put 'narrow-to-region 'disabled nil)
;;; Put line numbers in the status bar
(line-number-mode 1)
;;;
;;; Auto-modes for various (non-)extensions
(setq auto-mode-alist
      (append (list
	       '("\\.pl$" . cperl-mode)
		   '("\\.php*$" . php-mode)
		   '("\\.py*$" . python-mode)
	       '("^[^\\.]*$" . text-mode)) ;; If no extension, use text-mode
	      auto-mode-alist))
;;;
;;; Text-mode always uses auto-fill
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;;;
;;; Redefines all help function keys to work off of ESC-? rather than C-h.
;;; The reason for this is that IBM-PC users cannot use their
;;; backspace keys when C-h is bound to anything but backward-delete-char
;;;
;;; Remove C-h's status as a prefix key, changing it to a backspace key:
(global-unset-key "\C-h")
(define-key global-map "\C-h"  'backward-delete-char)
(setq search-delete-char (string-to-char "\C-h"))
;;;
;;; Set M-? to be the help command key, this causes all help commands
;;; to use this key as a prefix instead of C-h:
(define-key global-map "\M-?"  'help-command)
;;;
;;; Enable Zippy the Pinhead!
(autoload 'pinhead "pinhead" "Zippy the Pinhead quote." t)
;;;
;;; Enable python-mode
(autoload 'python-mode "python-mode" "Python editing mode." t)
;;;
(setq default-tab-width 2)
;;;
(auto-compression-mode t)
;;;
(put 'upcase-region 'disabled nil)
;;;
(require 'tramp)
(setq tramp-default-method "scp")
(setq tramp-auto-save-directory (quote "~/.emacs-autosave"))
;;;
;;; Put auto-save files in a specific directory
(custom-set-variables
 '(backup-directory-alist (quote (("." . "~/.emacs-autosave"))))
)
;;;
;;; Enable emacsclient
(server-start)

;;;;;; SEDev-Core conventions
; Use spaces, not tabs, for the "Tab" key.
(setq-default indent-tabs-mode nil)

; Basic unit of spaces for each indentation level: 4 spaces.
(add-hook 'c++-mode-hook '(lambda () (setq c-basic-offset 4)))
(add-hook 'c-mode-hook '(lambda () (setq c-basic-offset 4))) 

; A case or default label for switch blocks: 2 spaces for the 'case' line
; and then 2 more spaces for the case's block (total of 4 spaces from 'switch').
(add-hook 'c++-mode-hook '(lambda () (c-set-offset 'case-label 2)))
(add-hook 'c++-mode-hook '(lambda () (c-set-offset 'statement-case-intro 2)))
(add-hook 'c-mode-hook '(lambda () (c-set-offset 'case-label 2)))
(add-hook 'c-mode-hook '(lambda () (c-set-offset 'statement-case-intro 2)))

; A C++ private/protected/public access label.  This shifts the line
; back by two spaces when you hit the colon after the word "private",
; the word "protected", or the word "public" in a class.  Since the
; number in the parentheses here is negative, the shift is backwards.
; If you desire more of a backwards shift, increase the number but
; keep it negative.  If you desire no shift, make it zero.  If for
; some odd reason you desire a forward (rightward) shift, make the
; number a positive integer.
; NOTE: For this to actually work in a .h file (which is a "C" file
; by default), you must choose C++-mode (M-x c++-mode) for the buffer.
(add-hook 'c++-mode-hook '(lambda () (c-set-offset 'access-label -2)))

;;; color stuff
(setq white-background nil) 
(setq mac-allow-anti-aliasing nil) 
;; colors 
;; 
;; (add-to-list 'default-frame-alist '(foreground-color . "gold")) 
;; (add-to-list 'default-frame-alist '(cursor-color . "Yellow3")) 
;; ;; (add-to-list 'default-frame-alist '(background-color . "NavyBlue")) 
;; (set-face-background 'region "gray3") 
;; (set-face-foreground 'region "lightyellow") 
;; (set-face-foreground 'modeline "lightgoldenrod") 
;; (set-face-background 'modeline "gray21") 
;; (set-face-foreground 'highlight "lightyellow") 
;; (set-face-background 'highlight "yellow4") 
;; (set-face-foreground 'bold "white") 
;; (set-face-foreground 'italic "tan1") 
;; 
