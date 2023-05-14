function bak() {
    now=$(date +"%m%d%y-%T")
    cp $1 $1-$now.bak 
}
