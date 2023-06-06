function note {
    NOTES_PATH="$HOME/documents/notes.txt"
    echo "$(date)" >> $NOTES_PATH
    echo "$@\n" >> $NOTES_PATH
}

