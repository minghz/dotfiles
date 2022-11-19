function git_current_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
function git_remove_unmerged_branches {
  git fetch && git branch --merged |xargs git branch -d
}
function git_remove_gone_branches {
  git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d 
}
function git_diff_branches {
  git diff --stat --color $1..$(git_current_branch)
}

# Nice git logs
function gl() {
  TOTAL_COL=$(tput cols)
  HASH_COL_END=30
  DATE_COL_END=44
  NAME_COL_END=60
  MESG_COL_END=$(($NAME_COL_END + 80))
  REFS_COL_END=$TOTAL_COL

  HASH="%>|($HASH_COL_END,trunc)%Cblue%h"
  DATE="%<|($DATE_COL_END,trunc)%C(green)%cr"
  NAME="%<|($NAME_COL_END,trunc)%C(bold blue)%al"
  MESG="%<|($MESG_COL_END,trunc)%Creset%s"
  REFS="%<|($REFS_COL_END,trunc)%C(yellow)%d"

  git log --graph --pretty=tformat:"$HASH $DATE $NAME $MESG $REFS" $@ 
}
