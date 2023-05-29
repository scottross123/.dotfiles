function bak() {
    now=$(date +"%m%d%y-%T")
    cp -r $1 $1-$now.bak 
}
