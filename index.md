---
name: AppFair
title: null
---
<style>
body {
    height: 100vh;
    margin: 0;
    background-disabled: radial-gradient(circle, rgba(255,255,255,1) 0%, rgba(115,115,115,1) 100%);
}

.outerlync {
  position: absolute;
  top: 50%;
  left: 50%;
  margin-right: -50%;
  transform: translate(-50%, -50%);
  display: inline-block;
  background: transparent;
}

img.innerlync {
  max-width: 15vw;
  max-height: 15vh;
}

.innerlync {
  transform-style: preserve-3d;
  transition: ease-out 0.6s;
}

.outerlync:hover .innerlync {
  transition: ease-in-out 2.5s;
  transform: rotate(1800deg) rotateX(0deg) rotateY(0deg) rotateZ(0deg);
}
</style>
<a class="outerlync" href="https://github.com/appfair"><img src="https://www.appfair.net/favicon.ico" /></a>

<!--
### Creating an app with `Carnival`:

1. Launch a terminal window with `/System/Applications/Utilities/Terminal.app/`
1. Ensure developer tools are installed: `xcode-select --install`
1. Run Carnival: `sh -c "$(curl -fsSL https://www.appfair.net/carnival.sh)"`
-->
