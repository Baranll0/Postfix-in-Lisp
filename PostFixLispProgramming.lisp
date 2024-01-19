(defun calculate-postfix (expression)
  (let ((stack '()))
    (dolist (token expression)
      (cond
        ((numberp token) (push token stack))
        ((member token '(+ - * /))
          (let ((op2 (pop stack))
                (op1 (pop stack)))
            (case token
              (+ (push (+ op1 op2) stack))
              (- (push (- op1 op2) stack))
              (* (push (* op1 op2) stack))
              (/ (push (/ op1 op2) stack)))))))
    (pop stack)))
(print "Enter a postfix expression: ")
(setq expression (read));Read the expression from the keyboard
(print (calculate-postfix expression))