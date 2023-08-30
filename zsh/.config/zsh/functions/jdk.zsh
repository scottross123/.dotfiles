# TODO test if this works on linux, if not then make it work on linux

function jdk() {
    version=$1
    unset JAVA_HOME;
    export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
    java -version
}

