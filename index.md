---
name: AppFair
title: The App Fair
---

# Welcome to the App Fair

The App Fair is an independent app distribution platform for open-source applications written in Swift and utilizing a native SwiftUI user interface. 

## What is the "App Fair"

The "App Fair" consists of two separate Swift projects: the [appfair/Fair](https://github.com/appfair/Fair) library, which is a set of Swift runtime libraries that are bundled with all App Fair apps, and an [appfair/App](https://github.com/appfair/App) project that is meant to be forked and used as the template for your own project. 

Upon submitting a Pull Request([?](https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)) for your [appfair/App](https://github.com/appfair/App) fork's changes, your project will be automatically built, signed, packaged and distributed as a native macOS application via the [appfair/App releases](https://github.com/appfair/App/releases). 

These releases can be browsed, searched, and installed using the macOS [App-Fair/App](https://github.com/App-Fair/App), which acts as the hub for discovering, researching, installing, and updating apps.

The process is completely automated, instantaneous, and free. No registration or sign-up (other than a GitHub action) is required.

## The Structure of an App Fair app

### App Organization 

Your App is represented uniquely by a GitHub Organization, so the first step is to [create a new free organization](https://github.com/account/organizations/new). The organization name must be a two hyphen-separated words using only characters that are legal in URL paths. For example, the GitHub organization for **App Fair.app**, is [https://github.com/App-Fair/](https://github.com/App-Fair/).

Your app organization can be structured however you want, and can have consist of a team of as few or as many as you like. You can manage multiple apps by creating multiple separate organizations. 

### App Repository

Once your organization is set up, you create your app's project by forking the [https://github.com/appfair/App](https://github.com/appfair/App) repository. This is a Swift project that contains the shell of a cross-platform SwiftUI app.

Your app will exist in a top-level repository named, simply, "App".

It consists of a library, [Fair](https://github.com/appfair/Fair)

## The App/Fair Release Process

## Creating an App

## Updating an App

## App Customization

### Colors

### Icon

## Restrictions & Requirements

### App Restrictions

### Org Requirements

Must have issues & discussions enabled, must be public & not archived, must have a repository (or redirection) named "App" which contains a fork of the [appfair/App](https://github.com/appfair/App) repository.

### Licensing

The [appfair/App](https://github.com/appfair/App) repository is licensed under the GNU AGPL, which means that all forks of the project are also covered under that license. If you would like your app's code to be licensed differently, you can create a separate repository (either in the same Organization or a different) with another license of your choosing, and then reference that project from your `Package.swift` dependencies section. The App/Fair release process doesn't perform any validation of the licenses of any dependencies; it only requires that the license for the forked project itself remains unchanged, and that all the source files that act as inputs to the build process are available for inspection and analysis.

### Sandboxing

## Procedures 

## Current Limitations

Document-based apps?
No icon customization

## Developer FAQ

### Are App Fair apps signed?

App Fair apps are automatically signed with an "ad-hoc" certificate.

### Are App Fair apps notarized?

App Fair apps are not notarized. Apps that are installed through the **App Fair.app**.

### Where are App Fair apps installed?

The standard install location for App Fairs apps is the `/Applications/App Fair/` folder, which exists as a peer to the `/Applications/App Fair.app` application. 
Storing apps in a sub-folder of the standard `/Applications/` folder prevents name clashes with apps installed through other distribution mechanisms.

### How is versioning done?

App Fair apps do not use any sort of conventional version numbering scheme. Rather than a dotted-numeric identifier (such as `1.2.3`), App Fair apps are automatically versioned with a hash of the commit for the pull request that triggered the build of the app. What this means is that you can always take the version number (which you can copy & paste from Finder's `Get Info` on the app) and be able to browse the source code that went into the app's release by searching for that unique commit hash on GitHub.

### Can I release multiple versions at once?

No: there is only ever a active version of your app that can be made available through the [appfair/App releases](https://github.com/appfair/App/releases) (and, thus, available in the **App Fair.app**). 

### Can a user revert to an older version of an app if an update goes awry?

When **App Fair.app** installs an update to an existing app, it will place the older version in the user's Trash. As long as the user's trash remains un-emptied, the previous version of the app will remain available to use user for reversion.

### What prevents malicious apps from being distributed?

Xprotect, Sandboxing, GH Issues, GH Discussions, GH organization currency

### How can I remove my app from the App Fair?

The simplest way to prevent your app from showing up in **App Fair.app** is to mark your repository or organization as "private", or else archive (or delete) your organization's `/App` fork.

In addition, disabling issues or discussions for your organization's `/App` fork will also have the result of making your app no longer appear as a valid installation candidate in **App Fair.app**.

### How can I have someone else's app removed from the App Fair?

As the App Fair's `Fork-App-Integrate-Release` process is completely automated, there is no mechanism for intervention in the app release process apart from the usual GitHub channels. Organizations that are removed from GitHub will have the effect of removing that organization's `/App` fork from being installable with **App Fair.app**.

### Can App Fair apps be installed on non-macOS platforms?

**App Fair.app** is currently only available for macOS 12 on M1 & Intel, and so apps can only be installed and deployed on those platforms.

### Why do apps need to build for both macOS and iOS?

The integration phase of the App F.A.I.R. process will build your app's fork for both macOS and iOS. This is in order to be able to run your app's unit tests in a sandboxed environment, as well as automatically generating screenshots for users to preview in **App Fair.app**.

### What is the license for the App Fair project?

### Does my apps code need to be licenses under the AGPL?




