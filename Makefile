init:
	@go mod init github.com/renchunhui/dotfiles
	@go env -w GO111MODULE=on
	@go env -w GOPROXY=https://goproxy.cn
	@go get -u github.com/spf13/cobra
