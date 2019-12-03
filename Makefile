#
# Copyright (c) 2019 Chunhui Ren
#

# 安装
install:
	@chmod +x ./scripts/install.sh
	@./scripts/install.sh

# 卸载
uninstall:
	@chmod +x ./scripts/uninstall.sh
	@./scripts/uninstall.sh

# 清理
clean:
	@chmod +x ./scripts/clean.sh
	@./scripts/clean.sh

playground:
	@chmod +x ./scripts/playground.sh
	@./scripts/playground.sh

.PHONY: install
