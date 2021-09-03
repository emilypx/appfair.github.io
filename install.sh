#!/bin/bash
#
# Downloads, installs, and launches App Fair.app
#
set -u

FAIR_GROUND="App Fair"
echo "Welcome to the ${FAIR_GROUND}!"

INSTALL_PATH="/Applications" 
APP_PATH="${INSTALL_PATH}/${FAIR_GROUND}.app"
echo "This script will download and install the ${FAIR_GROUND} catalog browser app."

abort() {
  printf "%s\n" "$@"
  exit 1
}

if [ -z "${BASH_VERSION:-}" ]; then
  abort "Bash is required to interpret this script."
fi

# Check if script is run non-interactively (e.g. CI)
# If it is run non-interactively we should not prompt for passwords.
if [[ ! -t 0 || -n "${CI-}" ]]; then
  NONINTERACTIVE=1
fi

# First check OS.
OS="$(uname)"
if [[ "$OS" != "Darwin" ]]; then
  abort "The ${FAIR_GROUND} is only supported on macOS."
fi

# version check
if [ "`/usr/bin/sw_vers -productVersion | cut -f 1 -d '.'`" -lt 12 ]; then
    echo "Sorry, the ${FAIR_GROUND} requires macOS 12."
    echo "Come back soon!"
    exit 12
fi


getc() {
  local save_state
  save_state=$(/bin/stty -g)
  /bin/stty raw -echo
  IFS= read -r -n 1 -d '' "$@"
  /bin/stty "$save_state"
}

ring_bell() {
  if [[ -t 1 ]]; then
    printf "\a"
  fi
}

wait_for_user() {
  local c
  getc c
  if ! [[ "$c" == $'\r' || "$c" == $'\n' ]]; then
    exit 1
  fi
}

await_return() {
  if [[ -z "${NONINTERACTIVE-}" ]]; then
    ring_bell
    wait_for_user
  fi
}

# string formatters
if [[ -t 1 ]]; then
  tty_escape() { printf "\033[%sm" "$1"; }
else
  tty_escape() { :; }
fi
tty_mkbold() { tty_escape "1;$1"; }
tty_underline="$(tty_escape "4;39")"
tty_red="$(tty_mkbold 31)"
tty_green="$(tty_mkbold 32)"
tty_yellow="$(tty_mkbold 33)"
tty_blue="$(tty_mkbold 34)"
tty_purple="$(tty_mkbold 35)"
tty_cyan="$(tty_mkbold 36)"
tty_bold="$(tty_mkbold 39)"
tty_reset="$(tty_escape 0)"


ZIPURL="https://github.com/appfair/App/releases/download/App-Fair/App-Fair-macOS.zip"


echo ""
echo "  Destination: ${APP_PATH}"
echo "  Package: ${ZIPURL}"
echo ""
printf "Hit return to proceed: "
await_return

# quit the app if it is running
killall -qI "${FAIR_GROUND}"

# ensure we have write access to App Fair (otherwise we may need sudo)
mkdir -p "/Applications/${FAIR_GROUND}/" || abort "Could not create install folder: /Applications/${FAIR_GROUND}/"

chmod 777 "/Applications/${FAIR_GROUND}/" || abort "Could not fix permissions on /Applications/${FAIR_GROUND}/"

# remove previous version if it is installed
mv -f "${INSTALL_PATH}" ~/.Trash/ || true # failure is permitted

echo ""
echo ""
printf "  Installing the ${FAIR_GROUND}…"

curl -fsSL "${ZIPURL}" | ditto --noqtn -x -k - "${INSTALL_PATH}" || abort "Unable to install"

printf " Verifying…"

codesign --verify --deep --strict "${APP_PATH}" || abort "Validation Failed"
#spctl --add --label "${FAIR_GROUND}" "${APP_PATH}"
#spctl -a -vv -t execute "${APP_PATH}" || abort "Validation Failed"

echo " Success!"

APP_FAIR_COLORS="${tty_red}A${tty_reset}${tty_blue}p${tty_reset}${tty_yellow}p${tty_reset} ${tty_green}F${tty_reset}${tty_cyan}a${tty_reset}${tty_blue}i${tty_reset}${tty_red}r${tty_reset}"

echo "  Welcome to the ${APP_FAIR_COLORS}: ${tty_bold}Free & Fair, Forever${tty_reset}!"

echo ""

echo "The ${FAIR_GROUND} is now installed in ${APP_PATH}"
printf "Hit return to launch the app: "
await_return

# launch the app pointing to the ${FAIR_GROUND} folder
open -a "${APP_PATH}" "/Applications/${FAIR_GROUND}/"

