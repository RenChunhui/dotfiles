#
# Copyright (c) 2019 Chunhui Ren
# prePane


install:
	@chmod +x ./scripts/install.sh
	@./scripts/install.sh

uninstall:
	@chmod +x ./scripts/uninstall.sh
	@./scripts/uninstall.sh

playground:
	@chmod +x ./scripts/playground.sh
	@./scripts/playground.sh

.PHONY: install