.PHONY: run deps

run:
	ros run -Q -e '(ql:quickload :cl-starwars)' -e '(api:run-server)'

deps:
	ros run -Q -e '(ql:quickload :cl-starwars)'
