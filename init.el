(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
        (eval-print-last-sexp)))


;;C-hでバックスペース
(global-set-key "\C-h" 'delete-backward-char)
;packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/#/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)


(add-to-list 'load-path ".emacs.d/")
;;======================================================================
;; 言語・文字コード関連の設定
;;======================================================================

(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq file-name-coding-system 'utf-8)
;;
;;======================================================================
;; Mozc
;; CTRL-\で入力モード切替え
;;======================================================================
;(load-file "/usr/share/emacs/site-lisp/emacs-mozc/mozc.el")
;(require 'mozc)
;(setq default-input-method "japanese-mozc")
;(setq mozc-candidate-style 'overlay)
;;
;;=======================================================================
;; Misc
;;=======================================================================
(setq frame-title-format ; フレームのタイトル指定
      (concat "%b - emacs@" system-name))

(display-time) ;;時計を表示
(show-paren-mode t)
(setq inhibit-startup-message t) ;
(setq initial-scratch-message nil) ;スタートアップスクリーン抑制
(setq comment-style 'multiline) ;ボックスコメント
;;

;;=======================================================================
;; ~/.emacs.d/elpa/ にパスを通す
;;=======================================================================
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/"))
;;
;;=======================================================================
;;packages
;;=======================================================================
					;packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/#/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)
;;
;;=======================================================================
;;web-mode
;;=======================================================================
					;web-mode
(require 'web-mode)
;;; 適用する拡張子
(add-to-list 'auto-mode-alist '("\\.phtml$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ctp?$" . web-mode))

(defun web-mode-hook ()
  "Hooks for Web mode."
  ;; 変更日時の自動修正
  (setq time-stamp-line-limit -200)
  (if (not (memq 'time-stamp write-file-hooks))
      (setq write-file-hooks
	    (cons 'time-stamp write-file-hooks)))
  (setq time-stamp-format " %3a %3b %02d %02H:%02M:%02S %:y %Z")
  (setq time-stamp-start "Last modified:")
  (setq time-stamp-end "$")
  ;; web-modeの設定
  (setq web-mode-markup-indent-offset 2) ;; html indent
  (setq web-mode-css-indent-offset 2) ;; css indent
  (setq web-mode-code-indent-offset 2) ;; script indent(js,php,etc..)
  ;; htmlの内容をインデント
  ;; TEXTAREA等の中身をインデントすると副作用が起こったりするので
  ;; デフォルトではインデントしない
  ;;(setq web-mode-indent-style 2)
  ;; コメントのスタイル
  ;; 1:htmlのコメントスタイル(default)
  ;; 2:テンプレートエンジンのコメントスタイル
  ;; (Ex. {# django comment #},{* smarty comment *},{{-- blade comment --}})
  (setq web-mode-comment-style 2)
  ;; 終了タグの自動補完をしない
  ;;(setq web-mode-disable-auto-pairing t)
  ;; color:#ff0000;等とした場合に指定した色をbgに表示しない
  ;;(setq web-mode-disable-css-colorization t)
  ;;css,js,php,etc..の範囲をbg色で表示
  ;; (setq web-mode-enable-block-faces t)
  ;; (custom-set-faces
  ;; '(web-mode-server-face
  ;; ((t (:background "grey")))) ; template Blockの背景色
  ;; '(web-mode-css-face
  ;; ((t (:background "grey18")))) ; CSS Blockの背景色
  ;; '(web-mode-javascript-face
  ;; ((t (:background "grey36")))) ; javascript Blockの背景色
  ;; )
  ;;(setq web-mode-enable-heredoc-fontification t)
  )

;; 色の設定
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(web-mode-comment-face ((t (:foreground "#D30628")))) ;コメント
 '(web-mode-css-at-rule-face ((t (:foreground "#FF7F00")))) ;CSSタグ
 '(web-mode-css-pseudo-class-face ((t (:foreground "#FF7F00")))) ;CSS擬似クラス
 '(web-mode-css-rule-face ((t (:foreground "#A0D8EF")))) ;CSSタグ
 '(web-mode-doctype-face ((t (:foreground "#82AE46")))) ;docutype
 '(web-mode-html-attr-name-face ((t (:foreground "#C97586")))) ;属性名など
 '(web-mode-html-attr-value-face ((t (:foreground "#82AE46")))) ;属性値
 '(web-mode-html-tag-face ((t (:foreground "##4682ae" :weight bold)))) ;要素名
 '(web-mode-server-comment-face ((t (:foreground "#D9333F"))))) ;コメント
(add-hook 'web-mode-hook 'web-mode-hook)

;;=======================================================================
;;php-mode
;;=======================================================================
(autoload 'php-mode "php-mode")
(setq auto-mode-alist
      (cons '("\\.php\\'" . php-mode) auto-mode-alist))
(setq php-mode-force-pear t)
(add-hook 'php-mode-hook
	  '(lambda ()
	     (setq php-manual-path "/usr/local/share/php/doc/html")
	     (setq php-manual-url "http://www.phppro.jp/phpmanual/")))
