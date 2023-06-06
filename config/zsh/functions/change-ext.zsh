# change all file extensions in current directory to something else

function change-ext() {
    for file in *.$1; do 
        mv -- "$file" "${file%.$1}.$2"
    done
}
