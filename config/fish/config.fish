set PATH /usr/local/bin $PATH

set JAVA8_HOME /usr/libexec/java_home -v 1.8
set JAVA7_HOME /usr/libexec/java_home -v 1.7
set JAVA6_HOME /usr/libexec/java_home -v 1.6

alias git=hub
alias up="cd .."
alias vim="mvim"
alias python="python3"
alias grep="grep --color"

function mkcd
	mkdir $argv
	cd $argv
end

set -gx PATH \$PATH ~/pebble-dev/pebble-sdk-4.3-mac/bin:$PATH

export GOPATH=$HOME/work
export EDITOR=/usr/local/bin/mvim
