if [[ ! -d $dir/oh-my-zsh ]]; then
	print_info 'Installing Oh My Zsh...'

	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
