
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(evil-mode 1)
(evil-commentary-mode 1)
(global-undo-tree-mode 1)
(global-flycheck-mode 1)
(flycheck-pos-tip-mode 1)
(dumb-jump-mode 1)

(define-key evil-insert-state-map "jk" 'evil-normal-state)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages
   (quote
    (evil-commentary rust-mode dumb-jump flycheck-pos-tip flycheck evil)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
