## NPM / repo scaffolds

function npmify() {
    ngenplus $1 $2
    nstart
}

function nstart() {
    testling=0
    travis=0
    while getopts "tr:te:" OPTION
    do
        case $OPTION in
        tr) 
          travis=1
        ;;
        te) 
          testling=1
        ;;
        [?])
          echo "Usage: $0 [--tr] [--te] <description>" >&2
          return
        ;;
        esac
    done
    shift $(($OPTIND-1))

    # init repo
    git init
    hub create $(basename $PWD)

    (command -v pkginit >/dev/null 2>&1 && pkginit) || `npm init`

    echo "# $(basename $PWD)" > README.md
    if [ $travis ]; then
      echo "$(travisify badge)" >> README.md 
      travisify
      travisify test
    fi


    if [ $testling ]; then
      echo "$(testlingify badge)" >> README.md 
      testlingify
      testlingify test
    fi

    echo $1 >> README.md

   git add .
   git commit -m "initial package"
   git push origin master
}

function ngenplus() {
    local projectName=$1
    local isFree=""

    isFree="$(npm info $projectName 2>&1 | grep 'npm ERR! 404 You should bug the author to publish it')"

    # if $isFree is empty then BAD. If it's not empty then GOOD
    if [[ ! -n "$isFree" ]]; then
        echo "$projectName already taken on npm"
        npm info ${projectName} name description author
        exit 1
    fi

    local fileLocation="$(pwd)/$2"c

    cd ~/projects
    ngen $1
    cd $1

    if [ ! -z $2 ]; then
        cp "$fileLocation" ./index.js
    fi

    npm i
}

## Git and github work flows

function pr_github() {
    local branch=${1:-master}
    local remote=${2:-github}

    local status="$(git status | grep 'Changes to be committed')"

    if [[ -n "$status" ]]; then
        echo git commit
        git commit 3>&1 1>&2 2>&3
    fi

    git push origin $branch
    echo git push origin $branch
    local result=$(tempfile)
    hub pull-request -h origin/$branch -b $remote/$branch 2>$result
    local uri="$(cat $result)"
    echo hub pull-request -h origin/$branch -b $remote/$branch
    rm $result

    if [ "$uri" != "Aborting due to empty pull request title" ]
    then
        echo "open $uri"
        google-chrome "$uri"
    fi
    # TODO: auto merge
}

