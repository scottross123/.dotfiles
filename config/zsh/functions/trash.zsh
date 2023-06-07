TRASH=$HOME/trash

trash() {
    count=$(find "$TRASH" -maxdepth 1 \( -type f -o -type d \) | wc -l)
    bytes=$(du -c "$TRASH" | grep "total$" | awk '{print $1}')

    if (( bytes < 1024 )); then
      size="$bytes bytes"
    elif (( bytes < 1024**2 )); then
      size=$(echo "scale=2; $bytes / 1024" | bc)  # Size in kilobytes (KB)
      size="$size KB"
    elif (( bytes < 1024**3 )); then
      size=$(echo "scale=2; $bytes / (1024**2)" | bc)  # Size in megabytes (MB)
      size="$size MB"
    else
      size=$(echo "scale=2; $bytes / (1024**3)" | bc)  # Size in gigabytes (GB)
      size="$size GB"
    fi

	while getopts "elcs" opt; do
		case $opt in
		e | empty) 
            # should probably prompt user that this is permanenty
            sudo rm -rf $TRASH/*
            echo "deleted $count items from trash"
            ;;

		l | list) 
            ls -lA $TRASH
            ;;
		c | count)
            echo $count items in trash
            ;;
        s | size)
            echo $size
            ;;
        
		\?)
			echo "Invalid option: -$OPTARG" >&2
			#display_usage
			exit 1
			;;
		esac
	done

    shift $((OPTIND - 1))

    if [ $OPTIND -eq 1 ]; then
        mv "$@" $HOME/trash
    fi
}
