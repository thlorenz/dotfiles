## NPM / repo scaffolds

function npmify() {
    ngenplus $1 $2
    nstart
}

function nstart() {
    use_git=1
    travis=0

    # dumb args parsing since I couldn't get getopts to work inside a function
    # -a turns on travis, -g disables git
    for v in $@
    do
      [[ $v == '-a' ]] && travis=1
      [[ $v == '-g' ]] && use_git=0
    done

    echo 'initializing package ..'
    (command -v pkginit >/dev/null 2>&1 && pkginit) || `npm init`

    # Parse out description that we included in package.json during pkginit
    description=$(cat package.json | grep description | sed 's/\"description\"\ *:\ *\"//; s/\",//; s/^[ \t]*//')

    if [[ $use_git == 1 ]]
    then
      echo 'initializing repo ..'
      gitify $(basename $PWD) "$description"
      GIT=`which git`
    else
      GIT='echo git '
    fi

    if [[ $travis == 1 ]]; then
      mkdir -p test
      touch "test/$(basename $PWD).js"
      cp ~/.config/nstart/.travis.yml .
    fi

    echo "# $(basename $PWD)"                                                                      >> README.md

    if [[ $travis == 1 && $use_git == 1 ]]
    then
      echo 'initializing travis ..'
      echo "$(travisify badge)" | sed 's/\.png/.svg?branch=master/'                                >> README.md
      travisify
      travisify test
    elif [[ $travis == 1 ]]; then
      echo "Didn't setup traffic since a github repos is needed for that case"
      echo "Run: 'travisify && travisify test' later and add badge via 'travisify badge'"
    fi


    cp ~/.config/nstart/{LICENSE,.gitignore} .

    echo 'building readme ..'

    echo ''                                                                                        >> README.md
    echo $description                                                                              >> README.md
    echo ''                                                                                        >> README.md

    echo '```js'                                                                                   >> README.md
    echo '// TODO'                                                                                 >> README.md
    echo '```'                                                                                     >> README.md
    echo ''                                                                                        >> README.md

    echo '## Status'                                                                               >> README.md
    echo ''                                                                                        >> README.md
    echo 'Nix, Nada, Nichevo, Nothing --> go away!'                                                >> README.md
    echo ''                                                                                        >> README.md

    echo '## Installation'                                                                         >> README.md
    echo ''                                                                                        >> README.md
    echo "    npm install $(basename $PWD)"                                                        >> README.md
    echo ''                                                                                        >> README.md
    echo "## [API](https://thlorenz.github.io/$(basename $PWD))"                                    >> README.md
    echo ''                                                                                        >> README.md
    echo ''                                                                                        >> README.md
    echo '## License'                                                                              >> README.md
    echo ''                                                                                        >> README.md
    echo 'MIT'                                                                                     >> README.md

    $GIT add .
    # gitify already did an initial commit so we just amend our changes to it
    $GIT commit --amend --no-edit
    $GIT push origin master -f
}

function jsdocs () {
  (command -v docit >/dev/null 2>&1 || (echo 'npm install -g thlorenz/docit' && npm install -g thlorenz/docit))
  echo "docit --config ~/dotfiles/config/docit.json $@"
  docit --config ~/dotfiles/config/docit.json --dir='.' --includeFiles="$@"
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

