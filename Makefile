PYTHON := python3


.PHONY: build
build: clean
	@$(PYTHON) -m tox -e build
	ls -lh dist/*

.PHONY: check
check:
	@$(PYTHON) -m tox -e lint

.PHONY: clean
clean:
	@$(PYTHON) -m tox -e clean

.PHONY: fmt
fmt:
	@$(PYTHON) -m tox -e fmt

.PHONY: release
release:
	@$(PYTHON) setup.py release --sign
	@make clean

.PHONY: setup
setup:
	@$(PYTHON) -m pip install  --disable-pip-version-check --upgrade releasecmd tox

.PHONY: setup-dev
setup-dev: setup
	@$(PYTHON) -m pip install -q --disable-pip-version-check --upgrade -e .[test]
	@$(PYTHON) -m pip check
