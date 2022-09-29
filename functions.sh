function ssh_tunnel() {
  echo "Tunneling to localhost:5901 zhaomin4@ug240.eecg.utoronto.ca"
  ssh -L 5901:localhost:5901 -N -f -l zhaomin4 ug240.eecg.utoronto.ca
}
function psef() {
  ps aux | grep $1 | grep -v grep | awk '{print $2, "\t", $10, "\t", $11, $12, $13, $14, $15, $16, $17, $18}'
}
function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo ":( "
}
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

function trash(){
    mv "$@" ~/.Trash
}
function docker_bash {
  CONTAINER_ID=`docker ps | grep $1 |awk {'print $1'}`
  docker exec -it $CONTAINER_ID bash -c "stty cols $COLUMNS rows $LINES && bash";
}
function therapia_server {
  REDIS_DIR=/home/mzhao/dev/redis-4.0.2/
  TH_DIR=/home/mzhao/dev/therapia/
  gnome-terminal --tab --working-directory=$REDIS_DIR --command="./src/redis-server" \
    --tab --working-directory=$TH_DIR --command="bin/server" \
    --tab --working-directory=$TH_DIR --command="bundle exec sidekiq"
}
