#!/bin/sh -e
cat << EOF

 ██████  █████  ██████  ███    ██ ██ ██    ██  █████  ██ 
██      ██   ██ ██   ██ ████   ██ ██ ██    ██ ██   ██ ██ 
██      ███████ ██████  ██ ██  ██ ██ ██    ██ ███████ ██ 
██      ██   ██ ██   ██ ██  ██ ██ ██  ██  ██  ██   ██ ██ 
 ██████ ██   ██ ██   ██ ██   ████ ██   ████   ██   ██ ███████ 

EOF

#
#   sh -c "$(curl -fsSL https://www.appfair.net/carnival.sh)"
#
# This script does the following (you can do it all manually if you prefer):
#
# It will clone: https://github.com/appfair/carnival 
# into: ~/.appfair/carnival/
# and then delegate to the Swift tool with: swift run carnival

if [ ! -d "/Applications/Xcode.app" ]; then 
    echo "Warning: Xcode.app not found. You may need to run: xcode-select --install"
fi

mkdir -p ~/.appfair/
if [ ! -d ~/.appfair/carnival ]; then
    echo "_________________________________________________________________"
    echo "Cloning Carnival source from: https://github.com/appfair/carnival"
    echo "‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾"
    git clone https://github.com/appfair/carnival ~/.appfair/carnival
fi

# fetch the latest updates for the current branch
git -C ~/.appfair/carnival pull -q

if [ ! -d ~/.appfair/carnival/.build ]; then 
    echo "_________________________________________________________________"
    echo "Building Carnival for the first time. This will take but a moment"
    echo "‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾"
    swift build --package-path ~/.appfair/carnival
fi

swift run --package-path ~/.appfair/carnival carnival "${@}"

