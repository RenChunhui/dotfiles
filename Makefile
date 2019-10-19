#
# Copyright (c) 2019 Chunhui Ren
#

all:
	@chmod +x ./scripts/install.sh
	@./scripts/install.sh

clean:
	@chmod +x ./reset.sh
	@./reset.sh
