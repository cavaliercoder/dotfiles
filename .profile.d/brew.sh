# brew autocomplete
if which brew >/dev/null 2>&1; then
	source $(brew --repository)/completions/bash/brew
	for file in /usr/local/etc/bash_completion.d/*; do
		source $file
	done
fi

