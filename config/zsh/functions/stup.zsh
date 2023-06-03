# broken

function stup {
    today=`date +%-m-%-d-%y`
    dir=~/Documents/Standup
    file=$dir/$today.md
    if [ -f "$file" ]; then
        vim $file
    else
        title=`date +"%b %-d %Y"`
        echo "# $title\n\nAutobots Standup\n\n## Yesterday\n\n## Today\n\n## Blockers\n" > $file
        vim $file
    fi
}
