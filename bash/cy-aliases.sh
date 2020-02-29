alias tr='yarn tsc:tr && yarn lint:tr && yarn test'

function jtc () {
  node --require '/Users/thlorenz/Library/Application Support/JetBrains/Toolbox/apps/IDEA-U/ch-0/193.6494.35/IntelliJ IDEA.app/Contents/plugins/JavaScriptLanguage/helpers/jest-intellij/lib/jest-intellij-stdin-fix.js' \
    '/Users/thlorenz/dev/cy/cypress-node/cypress-node/node_modules/jest/bin/jest.js' --colors \
    --reporters '/Users/thlorenz/Library/Application Support/JetBrains/Toolbox/apps/IDEA-U/ch-0/193.6494.35/IntelliJ IDEA.app/Contents/plugins/JavaScriptLanguage/helpers/jest-intellij/lib/jest-intellij-reporter.js' \
    --verbose --runTestsByPath $1 --testNamePattern=$2
}

function ctc () {
  node '/Users/thlorenz/dev/cy/cypress-node/cypress-node/packages/cyr/bin/cyr.js' $1 \
    --reporters teamcity --verbose --testNamePattern=$2
}
