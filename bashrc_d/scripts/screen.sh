#
# Run screen in your shell if your shell isn't already running screen
# and IS interactive (This keeps screen from screwing up scp.)
#

case $- in
    *i*)
	if [ "$TERM" != "screen" ]; then
	    exec screen
	else
	    echo "Screen is started"
	fi
;;
esac
