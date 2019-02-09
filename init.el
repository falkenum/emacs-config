
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(setq-default frame-background-mode 'dark)
(setq-default racer-rust-src-path "/usr/src/rust/src/")

(evil-mode 1)
(evil-commentary-mode 1)
(global-undo-tree-mode 1)
(global-flycheck-mode 1)
(flycheck-pos-tip-mode 1)
(dumb-jump-mode 1)
(git-gutter-mode 1)

; autocompletion and finding stuff
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)



(defun newline-below ()
  (interactive)
  (setq inhibit-message 1)
  (evil-open-below 1)
  (evil-normal-state)
  (evil-previous-line)
  (setq inhibit-message nil)
)
  
(define-key evil-insert-state-map "jk" 'evil-normal-state)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "RET") 'newline-below)

; resetting some key bindings
(define-key evil-normal-state-map (kbd "SPC") nil)
(define-key evil-motion-state-map (kbd "C-w h") nil)
(define-key evil-motion-state-map (kbd "C-w j") nil)
(define-key evil-motion-state-map (kbd "C-w k") nil)
(define-key evil-motion-state-map (kbd "C-w l") nil)
(define-key evil-motion-state-map (kbd "C-w c") nil)
(define-key evil-motion-state-map (kbd "C-w v") nil)
(define-key evil-motion-state-map (kbd "C-w s") nil)

(defvar leader-key (kbd "SPC"))
(defun add-leader-sequence (seq func)
  (define-key evil-normal-state-map (concat leader-key seq) func))

(add-leader-sequence "wh" 'evil-window-left)
(add-leader-sequence "wj" 'evil-window-down)
(add-leader-sequence "wk" 'evil-window-up)
(add-leader-sequence "wl" 'evil-window-right)
(add-leader-sequence "wc" 'evil-window-delete)
(add-leader-sequence "wv" 'evil-window-vsplit)
(add-leader-sequence "ws" 'evil-window-split)

(add-leader-sequence "t" (lambda () (interactive) (term "/bin/bash")))
(add-leader-sequence "en" 'flycheck-next-error)
(add-leader-sequence "ep" 'flycheck-previous-error)
(add-leader-sequence "gs" 'magit-status)
(add-leader-sequence "ei" (lambda () (interactive) (find-file user-init-file)))

(add-leader-sequence "fs" 'save-buffer)

(add-leader-sequence "k" 'save-buffer)

;; (evil-set-initial-state 'help-mode 'emacs)

;; term colors
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(term-color-black ((t (:foreground "#3F3F3F" :background "#2B2B2B"))))
 '(term-color-blue ((t (:foreground "#7CB8BB" :background "#4C7073"))))
 '(term-color-cyan ((t (:foreground "#93E0E3" :background "#8CD0D3"))))
 '(term-color-green ((t (:foreground "#7F9F7F" :background "#9FC59F"))))
 '(term-color-magenta ((t (:foreground "#DC8CC3" :background "#CC9393"))))
 '(term-color-red ((t (:foreground "#AC7373" :background "#8C5353"))))
 '(term-color-white ((t (:foreground "#DCDCCC" :background "#656555"))))
 '(term-color-yellow ((t (:foreground "#DFAF8F" :background "#9FC59F"))))
 '(term-default-bg-color ((t (:inherit term-color-black))))
 '(term-default-fg-color ((t (:inherit term-color-white)))))


;;;; This snippet enables lua-mode

;; This line is not necessary, if lua-mode.el is already on your load-path
(add-to-list 'load-path "~/.emacs.d/lua-mode/")

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(add-to-list 'load-path "~/.emacs.d/arduino-mode")
(add-to-list 'auto-mode-alist '("\\.\\(pde\\|ino\\)$" . arduino-mode))
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)

(setq-default evil-shift-width 2)
(setq-default ring-bell-function
  (lambda ()
    (let
      ((orig-fg (face-foreground 'mode-line)))
          (set-face-foreground 'mode-line "#F2804F")
          (run-with-idle-timer 0.1 nil	;
                               (lambda (fg) (set-face-foreground 'mode-line fg))
                               orig-fg)))
)

;; (add-hook 'term-mode-hook (lambda () (message "hello")))
;; (add-hook 'normal-state-entry-hook (lambda () (message "hello")))
;; (evil-set-initial-state 'term-mode 'insert)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (flycheck-rust key-chord company racer git-gutter magit markdown-mode evil-commentary rust-mode dumb-jump flycheck-pos-tip flycheck evil)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

