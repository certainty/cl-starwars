RUN_LISP=sbcl --noinform --non-interactive
LISP=sbcl --noinform

build:
	$(RUN_LISP) --eval '(asdf:make :cl-starwars)'

run:
	$(RUN_LISP) --eval '(progn (asdf:load-system :cl-starwars) (api:run-server))'

deps:
	$(RUN_LISP) --eval '(ql:quickload :cl-starwars)'
