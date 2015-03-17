(add-to-list 'load-path "~/.emacs.d/xyh-emacs-lib/")
(require 'xyh-emacs-lib)

(global-set-key (kbd "M-u") 'move-line-backword)
(global-set-key (kbd "M-i") 'move-line-foreword)
(global-set-key (kbd "M-[") 'change-parentheses)




(add-to-list 'load-path "~/.emacs.d/cicada-nymph-mode/")

(require 'cicada-nymph-mode)
(require 'inferior-cicada-nymph-mode)

(define-prefix-command 'C-s-map)
(global-set-key (kbd "C-s") 'C-s-map)
(defun switch-to-buffer-*cicada-nymph* ()
  (interactive)
  (if (member-string? "*cicada-nymph*" (mapcar 'buffer-name (buffer-list)))
      (let ()
        (switch-to-buffer "*cicada-nymph*")
        (local-set-key (kbd "C-s C-d") 'previous-buffer))
      (let ()
        (run-cicada-nymph "cicada-nymph"))))
(global-set-key (kbd "C-s C-d") 'switch-to-buffer-*cicada-nymph*)

(add-hook 'cicada-nymph-mode-hook
          (lambda ()
            (local-set-key (kbd "C-h") 'hippie-expand)
            (local-set-key (kbd "M-q") 'query-replace)
            (local-set-key (kbd "C-c C-c")
                           'cicada-nymph-send-region-and-split-window)
            (local-set-key (kbd "C-<tab>")
                           'cicada-nymph-send-line-and-split-window-and-goto-next-line)))
