;;; cicada-nymph-mode.el -- major mode for editing cicada-nymph code


;; Copyright (C) 2014, XIE Yuheng <xyheme@gmail.com>

;; Author: XIE Yuheng <xyheme@gmail.com>
;; Version: 2014.05.31

;; Permission to use, copy, modify, and/or distribute this software
;; for any purpose with or without fee is hereby granted,
;; provided that the above copyright notice
;; and this permission notice appear in all copies.


;; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.


;;; Superfluous words :

;; you know what !!
;; when I first finish this mode,
;; my cicada-nymph code suddenly become so lovely,
;; too lovely,
;; I just stare at them for a while,
;; and can not even write down a new word !


;;; Usage :

;; Do not insert ascii TAB char in cicada-nymph-mode.

;; add the following to your ``.emacs'' :
;; (add-to-list 'load-path "{path to the directory that contain xyh-emacs-lib.el}")
;; (add-to-list 'load-path "{path to the directory that contain cicada-nymph-mode.el}")
;; (require 'cicada-nymph-mode)

;; note that
;; auto-indentation is not supported by cicada-nymph-mode.el
;; because auto-indentation functions written by other people
;; always do not satisfy my need,
;; while I provide the following functions to help you to indent your code :
;; ``turn-on-indent'' ``turn-off-indent''
;; ``move-line-foreword'' ``move-line-backword''
;; these four functions are defined in ``xyh-emacs-lib.el''

;; if you want to use other colors to highlight the code
;; just uncomment the ``color-test'' parts in
;; ``make-faces'' and ``setq cicada-nymph-font-lock-keywords''
;; restart emacs, and add the following words into
;; a buffer with ``cicada-nymph-mode'',
;; you will see these words highlighted,
;; then you could just make your choices
;; and hack the definitions of syntax highlighting :

;; ;; (* basic color : *)
;; ;; basic-ff0000-red
;; ;; basic-00ff00-green
;; ;; basic-0000ff-blue

;; ;; (* basic molokai : *)
;; ;; molokai-f92672-pink
;; ;; molokai-fd971f-orange
;; ;; molokai-a6e22e-chartreuse
;; ;; molokai-ae81ff-purple
;; ;; molokai-e6db74-darkgoldenrod

;; ;; (* basic molokai & solarized : *)
;; ;; DarkGreen
;; ;; solarized-859900-green
;; ;; DarkOliveGreen4
;; ;; molokai-808000-olive
;; ;; molokai-a6e22e-chartreuse
;; ;; solarized-b58900-yellow
;; ;; molokai-fd971f-orange
;; ;; molokai-e6db74-darkgoldenrod
;; ;; solarized-cb4b16-orange
;; ;; solarized-dc322f-red
;; ;; Firebrick
;; ;; molokai-800000-maroon
;; ;; molokai-960050-wine
;; ;; molokai-008080-teal
;; ;; solarized-2aa198-cyan
;; ;; solarized-268bd2-blue
;; ;; molokai-00ffff-aqua
;; ;; molokai-66d9ef-blue
;; ;; solarized-6c71c4-violet
;; ;; CadetBlue
;; ;; molokai-7070f0-slateblue
;; ;; molokai-ae81ff-purple
;; ;; Pink4
;; ;; molokai-d33682-palevioletred
;; ;; molokai-f92672-pink

;; ;; l1-depth-light-707183
;; ;; l2-depth-light-7388d6
;; ;; l3-depth-light-909183
;; ;; l4-depth-light-709870
;; ;; l5-depth-light-907373
;; ;; l6-depth-light-6276ba
;; ;; l7-depth-light-858580
;; ;; l8-depth-light-80a880
;; ;; l9-depth-light-887070

;; ;; l1-depth-dark--grey55
;; ;; l2-depth-dark--93a8c6
;; ;; l3-depth-dark--b0b1a3
;; ;; l4-depth-dark--97b098
;; ;; l5-depth-dark--aebed8
;; ;; l6-depth-dark--b0b0b3
;; ;; l7-depth-dark--90a890
;; ;; l8-depth-dark--a2b6da
;; ;; l9-depth-dark--9cb6ad

;; by the way, I use molokai-theme in emacs, I recommend it.



;;; the way I use cicada-nymph-mode :
;; (add-to-list 'load-path "~/.emacs.d/cicada-nymph-mode/")
;; (require 'cicada-nymph-mode)
;; (require 'inferior-cicada-nymph-mode)

;; ;; (define-prefix-command 'C-s-map)
;; ;; (global-set-key (kbd "C-s") 'C-s-map)
;; (defun switch-to-buffer-*cicada-nymph* ()
;;   (interactive)
;;   (if (member-string? "*cicada-nymph*" (mapcar 'buffer-name (buffer-list)))
;;       (let ()
;;         (switch-to-buffer "*cicada-nymph*")
;;         (local-set-key (kbd "C-s C-d") 'previous-buffer))
;;     (let ()
;;       (run-cicada-nymph "cicada-nymph"))))
;; (global-set-key (kbd "C-s C-d") 'switch-to-buffer-*cicada-nymph*)

;; (add-hook 'cicada-nymph-mode-hook
;;  (lambda ()
;;    (local-set-key (kbd "C-h") 'hippie-expand)
;;    (local-set-key (kbd "M-q") 'query-replace)
;;    (local-set-key (kbd "C-c C-e")
;;                   'cicada-nymph-send-region-and-split-window)
;;    (local-set-key (kbd "C-<tab>")
;;                   'cicada-nymph-send-line-and-split-window-and-goto-next-line)))


;;; Bugs:

;; 1 :
;; sometimes, when using ``(*'' at the beginning, and ``*)'' at the end,
;; to comment many lines of code,
;; syntax highlighting of the comment will fail.
;; to kill this bug,
;; one HAVE TO scan almost the whole buffer very frequently,
;; this will make the performance unacceptable (to me).
;; And I will wait for a better text editor to solve this problem.
;; I will NOT provide ``\'' and ``end-of-line'' as a another pair
;; to make comment in cicada-nymph,
;; NOR will I comment many continuous lines
;; with many ``(*'' ``*)'' pairs in my cicada-nymph code.
;; because my friends and I will write a new text editor to solve this !!



;;; Code :

(require 'xyh-emacs-lib)

(provide 'cicada-nymph-mode)


;; a syntax-table is a char-table
;; ``forward-word'' should act as finely as possible,
;; however, my highlighting must use
;; ``word-start'' and ``word-end''
;; to match the zero-length-string of start/end of a cicada-nymph-word,
;; of which the constituent is from ascii.33 to ascii.126
;; so, I have to redefine the functions such as ``forward-word''.
(make-syntaxes cicada-nymph-mode-syntax-table
               ;; default is word constituent
               ;; whitespace characters:
               (   '(0 . 32)    "-"  )
               (      127       "-"  ))

(make-syntaxes cicada-nymph-mode-syntax-table-with-symbol&with-open/close-delimiter
               ;; note that, if modify one syntax entry twice
               ;; the second will shadow the first
               ;; whitespace characters:
               (   '(0 . 32)    "-"  )
               (      127       "-"  )
               ;; symbol constituent:
               ;; the following functions need this:
               ;; ``forward-word'' and so on ...
               (  '(33 . 47)    "_"  )
               (  '(58 . 64)    "_"  )
               (  '(91 . 96)    "_"  )
               ( '(123 . 126)   "_"  )
               ;; open/close delimiter:
               ;; the following functions need this:
               ;; ``forward-sexp'' ``backward-sexp''
               ;; ``mark-sexp'' and so on ...
               (  ?\(    "("  )
               (  ?\)    ")"  )
               (  ?\[    "("  )
               (  ?\]    ")"  )
               (  ?\{    "("  )
               (  ?\}    ")"  ))

(make-syntaxes cicada-nymph-mode-syntax-table-with-symbol
               ;; note that, if modify one syntax entry twice
               ;; the second will shadow the first
               ;; whitespace characters:
               (   '(0 . 32)    "-"  )
               (      127       "-"  )
               ;; symbol constituent:
               ;; the following functions need this:
               ;; ``forward-word'' and so on ...
               (  '(33 . 47)    "_"  )
               (  '(58 . 64)    "_"  )
               (  '(91 . 96)    "_"  )
               ( '(123 . 126)   "_"  ))

(make-syntaxes cicada-nymph-mode-syntax-table-with-open/close-delimiter
               ;; note that, if modify one syntax entry twice
               ;; the second will shadow the first
               ;; whitespace characters:
               (   '(0 . 32)    "-"  )
               (      127       "-"  )
               ;; open/close delimiter:
               ;; the following functions need this:
               ;; ``forward-sexp'' ``backward-sexp''
               ;; ``mark-sexp'' and so on ...
               (  ?\(    "("  )
               (  ?\)    ")"  )
               (  ?\[    "("  )
               (  ?\]    ")"  )
               (  ?\{    "("  )
               (  ?\}    ")"  ))

(defun cicada-nymph-rebinding-functions-with-symbol-help (rebinding)
  `(define-key a-keymap ,(car rebinding)
     '(lambda ()
       (interactive)
       (with-syntax-table
           cicada-nymph-mode-syntax-table-with-symbol
         (,(cadr rebinding))))))
(defmacro cicada-nymph-rebinding-functions-with-symbol (&rest lis)
  (cons 'progn
        (mapcar
         (function cicada-nymph-rebinding-functions-with-symbol-help)
         lis)))

(defun cicada-nymph-rebinding-functions-with-open/close-delimiter-help (rebinding)
  `(define-key a-keymap ,(car rebinding)
     '(lambda ()
       (interactive)
       (with-syntax-table
           cicada-nymph-mode-syntax-table-with-open/close-delimiter
         (,(cadr rebinding))))))
(defmacro cicada-nymph-rebinding-functions-with-open/close-delimiter (&rest lis)
  (cons 'progn
        (mapcar
         (function cicada-nymph-rebinding-functions-with-open/close-delimiter-help)
         lis)))

(defun cicada-nymph-rebinding-functions-with-symbol&with-open/close-delimiter-help (rebinding)
  `(define-key a-keymap ,(car rebinding)
     '(lambda ()
       (interactive)
       (with-syntax-table
           cicada-nymph-mode-syntax-table-with-symbol&with-open/close-delimiter
         (,(cadr rebinding))))))
(defmacro cicada-nymph-rebinding-functions-with-symbol&with-open/close-delimiter (&rest lis)
  (cons 'progn
        (mapcar
         (function cicada-nymph-rebinding-functions-with-symbol&with-open/close-delimiter-help)
         lis)))

(defun say-this-key-is-not-bound ()
  (interactive)
  (message "this key is not bound!"))

(setq cicada-nymph-mode-map
      (let ((a-keymap (make-keymap)))

        ;; rebinding functions which look syntax-table
        (cicada-nymph-rebinding-functions-with-symbol&with-open/close-delimiter
         ((kbd "s-s") forward-sexp)
         ((kbd "s-w") backward-sexp)
         ((kbd "s-a") mark-sexp)
         ((kbd "s-e") in->)
         ((kbd "s-q") <-out)
         ((kbd "s-d") out->)
         ((kbd "M-f") forward-word)
         ((kbd "M-b") backward-word))
        (cicada-nymph-rebinding-functions-with-symbol
         ((kbd "M-d") (lambda () (kill-word 1)))
         ((kbd "M-DEL") (lambda () (backward-kill-word 1))))

        ;; no bother:
        (define-key a-keymap (kbd "M-t") 'say-this-key-is-not-bound)
        (define-key a-keymap (kbd "M-o") 'say-this-key-is-not-bound)
        (define-key a-keymap (kbd "M-l") 'say-this-key-is-not-bound)
        (define-key a-keymap (kbd "M-c") 'say-this-key-is-not-bound)

        ;; for indentation:
        (define-key a-keymap (kbd "M-u") 'move-line-backword)
        (define-key a-keymap (kbd "M-i") 'move-line-foreword)
        (define-key a-keymap (kbd "<tab>") '(lambda () (interactive) nil))

        ;; for comment:
        (define-key a-keymap (kbd "<menu> <menu>")
          '(lambda () (interactive)
            (insert "(* ")
            (point-to-register 666)
            (insert " -- *)")
            (jump-to-register 666)))

        a-keymap))




(make-faces
 (cicada-nymph-comment-face          ((default (:foreground "#FF8888"))))

 (cicada-nymph-exit-face             ((default (:foreground "#00ffff" :bold t))))
 (cicada-nymph-syntax-key-word-face  ((default (:foreground "#f92672" :bold t))))

 (cicada-nymph-number-face           ((default (:foreground "Pink4"))))

 (cicada-nymph-sentence-reader-face  ((default (:foreground "#ffff00" :bold t))))
 (cicada-nymph-word-to-define-face   ((default (:foreground "#ef5939" :bold t))))
 (cicada-nymph-lexicographer-face    ((default (:foreground "#ae81ff" :bold t))))

 (cicada-nymph-noun-face             ((default (:foreground "#fd971f"))))
 (cicada-nymph-important-noun-face   ((default (:foreground "#fd971f" :bold t))))
 (cicada-nymph-type-face             ((default (:foreground "#fd971f"))))

 (cicada-nymph-char-face             ((default (:foreground "#e6db78"))))
 (cicada-nymph-string-face           ((default (:foreground "#e6db74"))))


 (cicada-nymph-bound-variable-one-face   ((default (:foreground "#268bd2" :bold t))))
 (cicada-nymph-bound-variable-two-face   ((default (:foreground "#66d9ef" :bold t))))
 (cicada-nymph-bound-variable-three-face ((default (:foreground "#008080" :bold t))))
 (cicada-nymph-bound-variable-four-face  ((default (:foreground "#2aa198" :bold t))))

 (cicada-nymph-lambda-argument-one-face   ((default (:foreground "#cb4b16" :bold t))))
 (cicada-nymph-lambda-argument-two-face   ((default (:foreground "#dc322f" :bold t))))
 (cicada-nymph-lambda-argument-three-face ((default (:foreground "#800000" :bold t))))
 (cicada-nymph-lambda-argument-four-face  ((default (:foreground "Firebrick" :bold t))))


 (cicada-nymph-wody-face            ((default (:foreground "#a6e22e" :bold t))))

 (cicada-nymph-square-brackets-face  ((default (:foreground "#93a8c6"))))
 (cicada-nymph-parentheses-face      ((default (:foreground "#b0b1a3"))))
 (cicada-nymph-curly-braces-face     ((default (:foreground "#aebed8"))))
 ;; 97b098




 ;; color-test:

 ;; (Firebrick       ((default (:foreground "Firebrick"))))
 ;; (Pink4           ((default (:foreground "Pink4"))))
 ;; (DarkGreen       ((default (:foreground "DarkGreen"))))
 ;; (DarkOliveGreen4 ((default (:foreground "DarkOliveGreen4"))))
 ;; (CadetBlue       ((default (:foreground "CadetBlue"))))
 ;; (Firebrick       ((default (:foreground "Firebrick"))))

 ;; (basic-0000ff-blue     ((default (:foreground "#0000ff"))))
 ;; (basic-00ff00-green    ((default (:foreground "#00ff00"))))
 ;; (basic-ff0000-red      ((default (:foreground "#ff0000"))))

 ;; (molokai-ffffff-white         ((default (:foreground "#ffffff"))))
 ;; (molokai-f8f8f0-fg            ((default (:foreground "#f8f8f0"))))
 ;; (molokai-ff0000-red           ((default (:foreground "#ff0000"))))
 ;; (molokai-f92672-pink          ((default (:foreground "#f92672"))))
 ;; (molokai-ef5939-orange+5      ((default (:foreground "#ef5939"))))
 ;; (molokai-fd971f-orange        ((default (:foreground "#fd971f"))))
 ;; (molokai-ffff00-yellow        ((default (:foreground "#ffff00"))))
 ;; (molokai-e6db74-darkgoldenrod ((default (:foreground "#e6db74"))))
 ;; (molokai-c4be89-wheat         ((default (:foreground "#c4be89"))))
 ;; (molokai-808000-olive         ((default (:foreground "#808000"))))
 ;; (molokai-a6e22e-chartreuse    ((default (:foreground "#a6e22e"))))
 ;; (molokai-00ff00-lime          ((default (:foreground "#00ff00"))))
 ;; (molokai-008000-green         ((default (:foreground "#008000"))))
 ;; (molokai-1e0010-darkwine      ((default (:foreground "#1e0010"))))
 ;; (molokai-800000-maroon        ((default (:foreground "#800000"))))
 ;; (molokai-960050-wine          ((default (:foreground "#960050"))))
 ;; (molokai-008080-teal          ((default (:foreground "#008080"))))
 ;; (molokai-00ffff-aqua          ((default (:foreground "#00ffff"))))
 ;; (molokai-66d9ef-blue          ((default (:foreground "#66d9ef"))))
 ;; (molokai-7070f0-slateblue     ((default (:foreground "#7070f0"))))
 ;; (molokai-ae81ff-purple        ((default (:foreground "#ae81ff"))))
 ;; (molokai-d33682-palevioletred ((default (:foreground "#d33682"))))

 ;; (solarized-002b36-base03  ((default (:foreground "#002b36"))))
 ;; (solarized-073642-base02  ((default (:foreground "#073642"))))
 ;; (solarized-586e75-base01  ((default (:foreground "#586e75"))))
 ;; (solarized-657b83-base00  ((default (:foreground "#657b83"))))
 ;; (solarized-839496-base0   ((default (:foreground "#839496"))))
 ;; (solarized-93a1a1-base1   ((default (:foreground "#93a1a1"))))
 ;; (solarized-eee8d5-base2   ((default (:foreground "#eee8d5"))))
 ;; (solarized-fdf6e3-base3   ((default (:foreground "#fdf6e3"))))
 ;; (solarized-b58900-yellow  ((default (:foreground "#b58900"))))
 ;; (solarized-cb4b16-orange  ((default (:foreground "#cb4b16"))))
 ;; (solarized-dc322f-red     ((default (:foreground "#dc322f"))))
 ;; (solarized-d33682-magenta ((default (:foreground "#d33682"))))
 ;; (solarized-6c71c4-violet  ((default (:foreground "#6c71c4"))))
 ;; (solarized-268bd2-blue    ((default (:foreground "#268bd2"))))
 ;; (solarized-2aa198-cyan    ((default (:foreground "#2aa198"))))
 ;; (solarized-859900-green   ((default (:foreground "#859900"))))

 ;; (l1-depth-light-707183 ((default (:foreground "#707183"))))
 ;; (l1-depth-dark--grey55 ((default (:foreground "#grey55" ))))
 ;; (l2-depth-light-7388d6 ((default (:foreground "#7388d6"))))
 ;; (l2-depth-dark--93a8c6 ((default (:foreground "#93a8c6"))))
 ;; (l3-depth-light-909183 ((default (:foreground "#909183"))))
 ;; (l3-depth-dark--b0b1a3 ((default (:foreground "#b0b1a3"))))
 ;; (l4-depth-light-709870 ((default (:foreground "#709870"))))
 ;; (l4-depth-dark--97b098 ((default (:foreground "#97b098"))))
 ;; (l5-depth-light-907373 ((default (:foreground "#907373"))))
 ;; (l5-depth-dark--aebed8 ((default (:foreground "#aebed8"))))
 ;; (l6-depth-light-6276ba ((default (:foreground "#6276ba"))))
 ;; (l6-depth-dark--b0b0b3 ((default (:foreground "#b0b0b3"))))
 ;; (l7-depth-light-858580 ((default (:foreground "#858580"))))
 ;; (l7-depth-dark--90a890 ((default (:foreground "#90a890"))))
 ;; (l8-depth-light-80a880 ((default (:foreground "#80a880"))))
 ;; (l8-depth-dark--a2b6da ((default (:foreground "#a2b6da"))))
 ;; (l9-depth-light-887070 ((default (:foreground "#887070"))))
 ;; (l9-depth-dark--9cb6ad ((default (:foreground "#9cb6ad"))))

 )


;; non blank:
;; (not (in (0 . 32) 127))
;; alphabet or number:
;; (not (in (0 . 47) (58 . 64) (91 . 96) (123 . 127)))

(setq
 cicada-nymph-font-lock-keywords
 `(;; in the following, order matters

   ;; comment
   (;; ,(rx (minimal-match
    ;;       (seq (minimal-match
    ;;             (seq word-start
    ;;                  (group "(*")
    ;;                  word-end
    ;;                  (minimal-match (group (zero-or-more anything)))))
    ;;            ;; (minimal-match
    ;;            ;;  (seq word-start
    ;;            ;;       (group "*)")
    ;;            ;;       word-end))
    ;;            (seq word-start
    ;;                 (group "*)")
    ;;                 word-end)
    ;;            )))
    ,(rx (seq (minimal-match
               (seq word-start
                    (group "(*")
                    word-end
                    (minimal-match (group (zero-or-more anything)))))
              ;; (minimal-match
              ;;  (seq word-start
              ;;       (group "*)")
              ;;       word-end))
              (seq word-start
                   (group "*)")
                   word-end)))
     (1 'cicada-nymph-comment-face t)
     (2 'cicada-nymph-comment-face t)
     (3 'cicada-nymph-comment-face t))


   ;; very special words
   (,(rx word-start
         (group (or "exit" "已矣"))
         word-end)
     (1 'cicada-nymph-exit-face))

   (,(rx word-start
         (group (or "literal" "即"
                    "branch" "转" "轉"
                    "address" "址"
                    "char" "字"
                    "string" "八位組串"
                    "false?branch" "假则转" "假則轉"
                    "if" "则" "則"
                    "else" "否则" "否則"
                    "then" "再"
                    ))
         word-end)
     (1 'cicada-nymph-syntax-key-word-face))


   ;; important-noun
   (,(rx word-start
         (group (or "null"
                    ))
         word-end)
     (1 'cicada-nymph-important-noun-face))


   ;; lexicographer & reader for lexicographer
   (,(rx (seq word-start
              (group (or ":"
                         "夫" ;; chinese version of ``:''
                         ))
              (one-or-more " ")
              (group (one-or-more (not (in (0 . 32) 127))))
              word-end))
     (1 'cicada-nymph-sentence-reader-face)
     (2 'cicada-nymph-word-to-define-face))

   (,(rx word-start
         (group (or ";"
                    "者" ;; chinese version of ``;''
                    ))
         word-end)
     (1 'cicada-nymph-sentence-reader-face)
     (,(rx word-start
           (group (one-or-more (not (in (0 . 32) 127))))
           word-end)
       nil
       nil
       (1 'cicada-nymph-lexicographer-face)))


   ;; string
   (,(rx (minimal-match
          (seq word-start
               (group (or ":" "s"))
               (group "\" ")
               (group (one-or-more (not (in (0 . 32) 127)))
                      "\"")
               word-end)))
     (1 'cicada-nymph-sentence-reader-face)
     (2 'cicada-nymph-string-face)
     (3 'cicada-nymph-string-face))


   ;; number
   (,(rx word-start
         (group (zero-or-one "-")
                (in (?0 . ?9))
                (zero-or-more (not (in (0 . 32) 127))))
         word-end)
     (1 'cicada-nymph-number-face))


   ;; noun
   (,(rx (seq word-start
              (group (in (?A . ?Z))
                     (zero-or-more (not (in (0 . 32) 127))))
              word-end))
     (1 'cicada-nymph-noun-face))


   ;; char
   (,(rx (seq word-start
              (group "'"
                     (zero-or-more (not (in (0 . 32) 127)))
                     "'")
              word-end))
     (1 'cicada-nymph-char-face))


   ;; bound-variable
   (,(rx (seq word-start
              (group ":"
                     (not (in (0 . 47) (58 . 64) (91 . 96) (123 . 127)))
                     (zero-or-more (not (in (0 . 32) 127))))
              word-end))
     (1 'cicada-nymph-bound-variable-one-face))
   (,(rx (seq word-start
              (group "::"
                     (not (in (0 . 47) (58 . 64) (91 . 96) (123 . 127)))
                     (zero-or-more (not (in (0 . 32) 127))))
              word-end))
     (1 'cicada-nymph-bound-variable-two-face))
   (,(rx (seq word-start
              (group ":::"
                     (not (in (0 . 47) (58 . 64) (91 . 96) (123 . 127)))
                     (zero-or-more (not (in (0 . 32) 127))))
              word-end))
     (1 'cicada-nymph-bound-variable-three-face))
   (,(rx (seq word-start
              (group "::::"
                     (not (in (0 . 47) (58 . 64) (91 . 96) (123 . 127)))
                     (zero-or-more (not (in (0 . 32) 127))))
              word-end))
     (1 'cicada-nymph-bound-variable-four-face))


   ;; lambda-argument
   (,(rx (seq word-start
              (group "<:"
                     (not (in (0 . 47) (58 . 64) (91 . 96) (123 . 127)))
                     (zero-or-more (not (in (0 . 32) 127))))
              word-end))
     (1 'cicada-nymph-lambda-argument-one-face))
   (,(rx (seq word-start
              (group "<::"
                     (not (in (0 . 47) (58 . 64) (91 . 96) (123 . 127)))
                     (zero-or-more (not (in (0 . 32) 127))))
              word-end))
     (1 'cicada-nymph-lambda-argument-two-face))
   (,(rx (seq word-start
              (group "<:::"
                     (not (in (0 . 47) (58 . 64) (91 . 96) (123 . 127)))
                     (zero-or-more (not (in (0 . 32) 127))))
              word-end))
     (1 'cicada-nymph-lambda-argument-three-face))
   (,(rx (seq word-start
              (group "<::::"
                     (not (in (0 . 47) (58 . 64) (91 . 96) (123 . 127)))
                     (zero-or-more (not (in (0 . 32) 127))))
              word-end))
     (1 'cicada-nymph-lambda-argument-four-face))


   ;; wody
   (,(rx (seq word-start
              (group
               (or
                (seq (not (in (0 . 47) (58 . 64) (91 . 96) (123 . 127)))
                     (zero-or-more (not (in (0 . 32) 127)))
                     (not (in (0 . 47) (58 . 64) (91 . 96) (123 . 127)))
                     ":")
                (seq (not (in (0 . 47) (58 . 64) (91 . 96) (123 . 127)))
                     ":")))
              word-end))
     (1 'cicada-nymph-wody-face))


   ;; tyep
   (,(rx (seq word-start
              (group "<"
                     (one-or-more (not (in (0 . 32) 127)))
                     ">")
              word-end))
     (1 'cicada-nymph-type-face))


   ;; square-brackets
   (,(rx (seq word-start
              (group (or "[" "[list" "]"))
              word-end))
     (1 'cicada-nymph-square-brackets-face))

   ;; parentheses
   (,(rx (seq word-start
              (group (or "(" "(esc" ")"))
              word-end))
     (1 'cicada-nymph-parentheses-face))

   ;; curly-braces
   (,(rx (seq word-start
              (group (or "{" "}"))
              word-end))
     (1 'cicada-nymph-curly-braces-face))




   ;; color-test:

   ;; ("Firebrick"       (0 'Firebrick       t))
   ;; ("Pink4"           (0 'Pink4           t))
   ;; ("DarkGreen"       (0 'DarkGreen       t))
   ;; ("DarkOliveGreen4" (0 'DarkOliveGreen4 t))
   ;; ("CadetBlue"       (0 'CadetBlue       t))
   ;; ("Firebrick"       (0 'Firebrick       t))

   ;; ("basic-0000ff-blue"  (0 'basic-0000ff-blue))
   ;; ("basic-00ff00-green" (0 'basic-00ff00-green))
   ;; ("basic-ff0000-red"   (0 'basic-ff0000-red))

   ;; ("molokai-ffffff-white"         (0 'molokai-ffffff-white))
   ;; ("molokai-f8f8f0-fg"            (0 'molokai-f8f8f0-fg))
   ;; ("molokai-ff0000-red"           (0 'molokai-ff0000-red))
   ;; ("molokai-f92672-pink"          (0 'molokai-f92672-pink))
   ;; ("molokai-ef5939-orange+5"      (0 'molokai-ef5939-orange+5))
   ;; ("molokai-fd971f-orange"        (0 'molokai-fd971f-orange))
   ;; ("molokai-ffff00-yellow"        (0 'molokai-ffff00-yellow))
   ;; ("molokai-e6db74-darkgoldenrod" (0 'molokai-e6db74-darkgoldenrod))
   ;; ("molokai-c4be89-wheat"         (0 'molokai-c4be89-wheat))
   ;; ("molokai-808000-olive"         (0 'molokai-808000-olive))
   ;; ("molokai-a6e22e-chartreuse"    (0 'molokai-a6e22e-chartreuse))
   ;; ("molokai-00ff00-lime"          (0 'molokai-00ff00-lime))
   ;; ("molokai-008000-green"         (0 'molokai-008000-green))
   ;; ("molokai-1e0010-darkwine"      (0 'molokai-1e0010-darkwine))
   ;; ("molokai-800000-maroon"        (0 'molokai-800000-maroon))
   ;; ("molokai-960050-wine"          (0 'molokai-960050-wine))
   ;; ("molokai-008080-teal"          (0 'molokai-008080-teal))
   ;; ("molokai-00ffff-aqua"          (0 'molokai-00ffff-aqua))
   ;; ("molokai-66d9ef-blue"          (0 'molokai-66d9ef-blue))
   ;; ("molokai-7070f0-slateblue"     (0 'molokai-7070f0-slateblue))
   ;; ("molokai-ae81ff-purple"        (0 'molokai-ae81ff-purple))
   ;; ("molokai-d33682-palevioletred" (0 'molokai-d33682-palevioletred))

   ;; ("solarized-002b36-base03"  (0 'solarized-002b36-base03)  )
   ;; ("solarized-073642-base02"  (0 'solarized-073642-base02)  )
   ;; ("solarized-586e75-base01"  (0 'solarized-586e75-base01)  )
   ;; ("solarized-657b83-base00"  (0 'solarized-657b83-base00)  )
   ;; ("solarized-839496-base0"   (0 'solarized-839496-base0)   )
   ;; ("solarized-93a1a1-base1"   (0 'solarized-93a1a1-base1)   )
   ;; ("solarized-eee8d5-base2"   (0 'solarized-eee8d5-base2)   )
   ;; ("solarized-fdf6e3-base3"   (0 'solarized-fdf6e3-base3)   )
   ;; ("solarized-b58900-yellow"  (0 'solarized-b58900-yellow)  )
   ;; ("solarized-cb4b16-orange"  (0 'solarized-cb4b16-orange)  )
   ;; ("solarized-dc322f-red"     (0 'solarized-dc322f-red)     )
   ;; ("solarized-d33682-magenta" (0 'solarized-d33682-magenta) )
   ;; ("solarized-6c71c4-violet"  (0 'solarized-6c71c4-violet)  )
   ;; ("solarized-268bd2-blue"    (0 'solarized-268bd2-blue)    )
   ;; ("solarized-2aa198-cyan"    (0 'solarized-2aa198-cyan)    )
   ;; ("solarized-859900-green"   (0 'solarized-859900-green)   )

   ;; ("l1-depth-light-707183"    (0 'l1-depth-light-707183))
   ;; ("l1-depth-dark--grey55"    (0 'l1-depth-dark--grey55))
   ;; ("l2-depth-light-7388d6"    (0 'l2-depth-light-7388d6))
   ;; ("l2-depth-dark--93a8c6"    (0 'l2-depth-dark--93a8c6))
   ;; ("l3-depth-light-909183"    (0 'l3-depth-light-909183))
   ;; ("l3-depth-dark--b0b1a3"    (0 'l3-depth-dark--b0b1a3))
   ;; ("l4-depth-light-709870"    (0 'l4-depth-light-709870))
   ;; ("l4-depth-dark--97b098"    (0 'l4-depth-dark--97b098))
   ;; ("l5-depth-light-907373"    (0 'l5-depth-light-907373))
   ;; ("l5-depth-dark--aebed8"    (0 'l5-depth-dark--aebed8))
   ;; ("l6-depth-light-6276ba"    (0 'l6-depth-light-6276ba))
   ;; ("l6-depth-dark--b0b0b3"    (0 'l6-depth-dark--b0b0b3))
   ;; ("l7-depth-light-858580"    (0 'l7-depth-light-858580))
   ;; ("l7-depth-dark--90a890"    (0 'l7-depth-dark--90a890))
   ;; ("l8-depth-light-80a880"    (0 'l8-depth-light-80a880))
   ;; ("l8-depth-dark--a2b6da"    (0 'l8-depth-dark--a2b6da))
   ;; ("l9-depth-light-887070"    (0 'l9-depth-light-887070))
   ;; ("l9-depth-dark--9cb6ad"    (0 'l9-depth-dark--9cb6ad))

   ))


(defvar cicada-nymph-mode-hook nil)


;;;###autoload
(add-to-list 'auto-mode-alist '("\\.cicada-nymph$" . cicada-nymph-mode))

(defun cicada-nymph-mode ()
  "major mode for editing cicada-nymph language files"
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table cicada-nymph-mode-syntax-table)
  (use-local-map cicada-nymph-mode-map)
  (set (make-local-variable 'font-lock-defaults)
       '(cicada-nymph-font-lock-keywords))
  (set (make-local-variable
        'comment-start) "(*")
  (set (make-local-variable
        'comment-end)  "*)")
  (set (make-local-variable
        'comment-style)  'extra-line)
  (setq major-mode 'cicada-nymph-mode)
  (setq mode-name "cicada-nymph")
  (turn-off-indent)
  (run-hooks 'cicada-nymph-mode-hook))


;;; The end of cicada-nymph-mode.el
