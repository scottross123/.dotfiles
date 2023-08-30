# stolen from undg on github

load_nvm() {
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
}

nvm() {
    unset -f nvm
    load_nvm
    nvm "$@"
}

node() {
    unset -f node
    load_nvm
    node "$@"
}

npm() {
    unset -f npm
    load_nvm
    npm "$@"
}

yarn() {
    unset -f yarn
    load_nvm
    yarn "$@"
}

nx() {
    unset -f nx
    load_nvm
    nx "$@"
}

npx() {
    unset -f npx
    load_nvm
    npx "$@"
}
