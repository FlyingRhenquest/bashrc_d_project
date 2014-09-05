#
# Greyfox's Bashrc. Copy this to .bashrc. Make sure bashrc_d is in
# in your top level home directory prior to doing this. When working
# on your shell profile scripts, always be sure to open a NEW TERMINAL
# to test your profile, prior to logging out in the window you were
# using to work on your profile. This will allow you to easily fix
# things if you screw up your shell environment. I suggest always
# doing this when adding new scripts to the bashrc_d environment.
#
# Always back up your previous .bashrc before starting work on
# your profile scripts! Very important!
#

#
# Deal with source'd scripts that like to exit when they're done
# running (looking at you, bash_completion!)
#
alias exit='echo not exiting'

#
# If we're not running interacticvely, we want our startup to be less
# chatty. I've experimented with making it less chatty all the time
# but have found I like the status messages on startup. If your
# profile script has any output for non-interactive sessions,
# it messes up scp.
#

CMD_REDIR=""

case $- in
    *i*)
	;;
    *)
	CMD_REDIR='> /dev/null 2>&1'
	;;
esac

#
# Function to run scripts in directory
#

run_scripts() {
    for i in $1/*.sh ; do
	eval echo Running $i $CMD_REDIR
	eval source $i $CMD_REDIR
    done
}

#
# Run scripts
#

run_scripts ${HOME}/bashrc_d/`uname -s`/`hostname -s`
run_scripts ${HOME}/bashrc_d/`uname -s`/all
run_scripts ${HOME}/bashrc_d/all

#
# Now that we're done with that, reset exit so it exits
#

unalias exit
