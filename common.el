;; functions

(defun find-init-file ()
    (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun disable-all-themes ()
  (dolist (theme custom-enabled-themes)
    (disable-theme theme)))

(defun switch-to-theme (new-theme)
  (interactive
   (list (intern (completing-read "Load custom theme: "
			                            (mapcar 'symbol-name
				                                  (custom-available-themes))))))
  (disable-all-themes)
  (load-theme new-theme))


;; keybindings

(global-set-key (kbd "C-x t") 'toggle-truncate-lines)

(global-set-key (kbd "C-x m") 'shell)


;; looks and sound

(menu-bar-mode 0)
(tool-bar-mode 0)

(setq ring-bell-function (lambda ())) ;; neither ring nor flash screen


;; other

;; always ask y or n instead of yes or no
;; don't complain if you shoot yourself in the foot
(defalias 'yes-or-no-p 'y-or-n-p)

;; activate all deactivated commands
;; by not checking wether a command is disabled
(setq disabled-command-function nil)
