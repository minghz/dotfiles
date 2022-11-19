autoload colors; colors

# prints out the main branch name
function main_branch_name () {
  possible_names=(main master)

  for name in $possible_names; do
    git rev-parse --verify origin/$name -- >/dev/null 2>/dev/null

    if [ $? -eq 0 ]; then
      echo $name
      return
    fi
  done

  echo "error" # could be a connection issue, or permission etc.
}

#
# Check if the branch has remote upstream changes that should be pulled.
# By default it just prints the status of the repo.
#
# -update = Pass this in to actually pull outdated repos
#
# if you want to run "git pull" on all dirs in the current dir, can also run:
#   find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;
#
function repos_update_status () {
  zparseopts -E -D -- \
             -update:=o_update

  # Loops through the directories and check if its a gir dir
  for dir in */; do
    if [ ! -d $dir/.git/ ]; then
      continue # its not a git directory. skip
    fi

    pushd $dir > /dev/null

    # Check the origin branch name. Also checks git connection works
    main_branch_name=$(main_branch_name)
    if [ "$main_branch_name" = "error" ]; then
      echo $fg[red]Repo update status unknown!$reset_color $dir
      continue # could not obtain branch name because something is wrong
    fi

    # Check if there are new changes to pull
    origin_sha=`git log -1 origin/$main_branch_name --pretty=format:"%H"`
    local_sha=`git log -1 --pretty=format:"%H"`
    git merge-base --is-ancestor $origin_sha $local_sha

    if [ $? -eq 0 ]; then
      echo $fg[green]Repo up-to-date!$reset_color $dir
    else
      echo $fg[yellow]Repo has updates available!$reset_color $dir
      if [ "$o_update" != "" ]; then
        git pull origin $main_branch_name
      fi
    fi

    popd > /dev/null
  done
}

