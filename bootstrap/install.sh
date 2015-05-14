set -e # Halt on first error

# Define DOTDIR to be location of this repository
export DOTDIR="$( cd "$( dirname $( dirname "$0" ) )" && pwd )"

source "$DOTDIR/bootstrap/init.sh"
source "$DOTDIR/bootstrap/setup.sh"

setup_dot install "$@"

# Copy standalone files into the $user home directory
cp -a $DOTDIR/files/. ~/
