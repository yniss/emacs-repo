(ert-deftest elpy-shell-toggle-dedicated-shell-should-give-dedicated-shells ()
  (elpy-testcase ()
    (elpy-enable)
    (python-mode)
    (elpy-shell-toggle-dedicated-shell)
    (let ((bufname (buffer-name)))
      (save-excursion
        (elpy-shell-switch-to-shell)
        (should (string= (buffer-name)
                         (format "*Python[%s]*"bufname))))
      (elpy-shell-toggle-dedicated-shell)
      (save-excursion
        (elpy-shell-switch-to-shell)
        (should (string= (buffer-name)
                         "*Python*"))))))