## NPM / repo scaffolds

function npmify() {
    ngenplus $1 $2
    nstart
}

function nstart() {
    testling=0
    travis=0

    # dumb args parsing since I couldn't get getopts to work inside a function
    # -a turns on travis, -s turns on testling 
    for v in $@
    do
      [[ $v == '-a' ]] && travis=1
      [[ $v == '-s' ]] && testling=1
    done

    echo 'initializing package ..'
    (command -v pkginit >/dev/null 2>&1 && pkginit) || `npm init`

    # Parse out description that we included in package.json during pkginit
    description=$(cat package.json | grep description | sed 's/\"description\"\ *:\ *\"//; s/\",//; s/^[ \t]*//')

    echo 'initializing repo ..'
    gitify $(basename $PWD) "$description"

    echo "# $(basename $PWD)"                                                                      >> README.md

    if [[ $travis == 1 ]]; then
      echo 'initializing travis ..'
      echo "$(travisify badge)" >> README.md 
      travisify
      travisify test
    fi


    if [[ $testling == 1 ]]; then
      echo 'initializing testling ..'
      echo "" >> Readme.md
      echo "$(testlingify badge)" >> README.md 
      testlingify
      testlingify test
    fi

    if [[ $travis == 1 ||  $testling == 1 ]]; then
      mkdir test
      touch test/index.js
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

    echo '## Installation'                                                                         >> README.md
    echo ''                                                                                        >> README.md
    echo "    npm install $(basename $PWD)"                                                        >> README.md
    echo ''                                                                                        >> README.md
    echo '## API'                                                                                  >> README.md
    echo ''                                                                                        >> README.md
    echo ''                                                                                        >> README.md
    echo '## License'                                                                              >> README.md
    echo ''                                                                                        >> README.md
    echo 'MIT'                                                                                     >> README.md

    git add .
    # gitify already did an initial commit so we just amend our changes to it
    git commit --amend --no-edit 
    git push origin master -f
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

