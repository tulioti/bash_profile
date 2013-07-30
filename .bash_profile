# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# source ~/.rbenv/completions/rbenv.bash

# prompt with ruby version
# rbenv version | sed -e 's/ .*//'
__rbenv_ps1 ()
{
  rbenv_ruby_version=`rbenv version | sed -e 's/ .*//'`
  printf $rbenv_ruby_version
}

# prompt with git && rbenv
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# prompt with git && rbenv
if [ -f $BASH_COMPLETION_DIR/git ] && [ -f `which rbenv` ]; then
  export PS1='\[\033[01;32m\]\u@\h\[\033[01;31m\] \w$(__git_ps1) ruby=$(__rbenv_ps1) \n\[\033[01;34m\]\$\[\033[00m\] '
elif [ -f $BASH_COMPLETION_DIR/git ]; then
  export PS1='\[\033[01;32m\]\u@\h\[\033[01;31m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\] '
elif [ `which rbenv` ]; then
  export PS1='\[\033[01;32m\]\u@\h\[\033[01;31m\] \w \[\033[01;35m\]$(__rbenv_ps1) $(parse_git_branch) \n\[\033[01;34m\]\$\[\033[00m\]  '
else
  export PS1='\[\033[01;32m\]\u@\h\[\033[01;31m\] \w \n\[\033[01;34m\]\$\[\033[00m\] '
fi

export HISTSIZE=5000
export HISTFILESIZE=5000

alias ll='ls -alrth'
alias ..='cd ..'
alias ...='cd ..; cd ..'
