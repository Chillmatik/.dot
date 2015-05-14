# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Load and bootstrap DOTFiles
export DOTDIR="/home/$WHOAMI/.dot"
source $DOTDIR/bootstrap/startup.sh
