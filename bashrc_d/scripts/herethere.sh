#
# These aliases allow you to stash your current directory before you
# CD to another one and to swap your current directory with the pushed
# stashed one so you can switch between two directories easily.
#

alias here='echo $(pwd) > ${HOME}/.here'
alias there='cd $(cat ${HOME}/.here)'
alias swap='oldhere=$(cat ${HOME}/.here); echo $(pwd) > ${HOME}/.here; cd $oldhere'
