;;; simple-space.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2025  jared
;;
;; Author:  Jared Arcilla <arcillajared@gmail.com>
;; Maintainer:  Jared Arcilla <arcillajared@gmail.com>
;; Created: January 11, 2025
;; Modified: January 11, 2025
;; Version: 0.0.1
;; Homepage: https://github.com/jparcill/simple-space
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;

;;;###autoload
(defun simple-space-habit-succeeded ()
    (interactive)
    (let* ((properties (org-entry-properties))
           (spaced-rep-str (cdr (assoc "SPACEDREP" properties)))
           (spaced-rep
            (if (eq spaced-rep-str nil) 1 (string-to-number spaced-rep-str))))
      (progn
        (org-schedule nil (format "+%dd" spaced-rep))
        (org-set-property "SPACEDREP" (min (number-to-string (* spaced-rep 2)) 30)))))

;;;###autoload
(defun simple-space-habit-restart ()
  (interactive)
  (org-set-property "SPACEDREP" "1")
  (habit-checked))

(provide 'simple-space)
;;; simple-space.el ends here
