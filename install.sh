#!/bin/bash
#
# Downloads, installs, and launches App Fair.app
#
set -u
echo "Welcome to the App Fair!"

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
  abort "The App Fair is only supported on macOS."
fi

# version check
if [ "`/usr/bin/sw_vers -productVersion | cut -f 1 -d '.'`" -lt 12 ]; then
    echo "Sorry, the App Fair requires macOS 12."
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
INSTALL_PATH="/Applications/" # TODO: permit override

echo "This script will download and install the App Fair catalog browser app."

echo ""
echo "  Destination: ${INSTALL_PATH}"
echo "  Package: ${ZIPURL}"
echo ""
printf "Hit return to proceed: "
await_return


echo ""
echo ""
printf "  Installing the App Fair…"

curl -fsSL "${ZIPURL}" | ditto --noqtn -x -k - "${INSTALL_PATH}"

echo " Success!"


APP_FAIR="${tty_red}A${tty_reset}${tty_blue}p${tty_reset}${tty_yellow}p${tty_reset} ${tty_green}F${tty_reset}${tty_cyan}a${tty_reset}${tty_blue}i${tty_reset}${tty_red}r${tty_reset}"

echo "  Welcome to the ${APP_FAIR}!"

echo ""

echo "The App Fair is now installed in /Applications/App Fair.app"
printf "Hit return to launch the app: "
await_return

open "/Applications/App Fair.app"

