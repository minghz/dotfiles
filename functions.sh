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
function trash(){
    mv "$@" ~/.Trash
}
function docker_bash {
  CONTAINER_ID=`docker ps | grep $1 |awk {'print $1'}`
  docker exec -it $CONTAINER_ID bash -c "stty cols $COLUMNS rows $LINES && bash";
}
