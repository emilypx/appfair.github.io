#!/bin/sh -e
#
# Downloads, installs, and launches App Fair.app
#

echo "Welcome to the App Fair!"

# version check
if [ "$(/usr/bin/sw_vers -productVersion | cut -f 1 -d '.')" != "12" ]; then
    echo "Sorry, the App Fair requires macOS 12."
    echo "Come back soon!"
    exit 12
fi

ZIPURL="https://github.com/appfair/App/releases/download/App-Fair/App-Fair-macOS.zip"
INSTALL_PATH="/Applications/" # TODO: permit override

echo "This script will download and install the App Fair catalog browser app."
echo ""
echo "  Destination: ${INSTALL_PATH}"
echo "  Package: ${ZIPURL}"
echo ""
printf "Hit return to proceed. "
read whatever

curl -fsSL "${ZIPURL}" | ditto --noqtn -x -k - "${INSTALL_PATH}"

echo "The App Fair is now installed in /Applications/App Fair.app"
printf "Hit return to launch the app."
read whatever

open "/Applications/App Fair.app"

