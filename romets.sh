NAME="romets-app"
DIRECTORY="."

build() {
    cd $DIRECTORY
    mkdir $NAME
    cd $NAME
    npm init --y
    npm install --save-dev typescript ts-node @types/node
    ./node_modules/.bin/tsc --init
    mkdir src
    cd src
    touch index.ts
    echo "console.log('TypeScript App is Created✅');" >>index.ts
    cd ..
    ./node_modules/.bin/ts-node src/index.ts
}

show_help() {
    echo "romets [-n <NAME> -d <DIRECTORY> -h <HELP>]"
    echo
    echo "Arguments:"
    echo
    echo "NAME, the project name"
    echo "DIRECTORY, the path of the project"
    echo "HELP, show help"
    exit -1
}

while getopts 'n:d:h' OPT; do
    case $OPT in
    n) NAME="$OPTARG" ;;
    d) DIRECTORY="$OPTARG" ;;
    h) show_help ;;
    *) build ;;
    esac
done

build
