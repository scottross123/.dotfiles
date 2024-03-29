function plug() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    # test that a .git folder is actually in this folder as well
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then 
        # For plugins
        add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

