#!/bin/zsh -e
# downloads, installs, and launches the App Fair.app

echo "Welcome to the App Fair!"
ZIPURL="https://github.com/appfair/App/releases/download/App-Fair/App-Fair-macOS.zip"
INSTALL_PATH="/Applications/" # TODO: permit override

echo "This installer script will download and install the App Fair catalog browser app in your ${INSTALL_PATH} folder."

echo -n "Hit return to proceed. "
read whatever

curl -fsSL ${ZIPURL} | ditto --noqtn -x -k - ${INSTALL_PATH}

echo "The App Fair is now installed in /Applications/App Fair.app"
echo -n "Hit return to launch the app."
read whatever

open "/Applications/App Fair.app"

