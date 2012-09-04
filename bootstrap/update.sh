# Returns non-zero exit status if no updates took place or error occurred
update_dot () {
  local updated=1
  local stashed=0;
  local cur_revision=`git rev-parse HEAD`

  git fetch origin
  if [ "`git rev-parse origin/master`" == "$cur_revision" ]; then
    echo "No updates"
    return 1
  fi

  if ! git diff-index --quiet HEAD; then
    git stash && stashed=1;
  fi

  if ! git rebase origin/master; then
    echo "Unable to update Dot; local branch has diverged from remote"
    updated=0
  else
    source "$DOTDIR/bootstrap/setup.sh"
    setup install
    updated=$?
  fi

  # If any stashed changes don't apply, undo the action
  if [ $stashed -eq 1 ] && ! git stash pop; then
    git reset --hard "$cur_revision" && git stash pop
    echo "Error applying local changes; reverting to original revision"
  fi

  return $updated
}
