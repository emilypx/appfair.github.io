---
name: AppFair
title: The App Fair
---

# Welcome to the App Fair

The App Fair is an independent app distribution platform for free open-source macOS applications created by students and educators.
App Fair apps use modern native frameworks and user-interface elements with a focus on performance, efficiency, accessibility and inclusiveness.

## The App Fair for App Users

From an end-user standpoint, the **App Fair.app** catalog browser application allows you to research, discover, install, and update applications from an unlimited online collection. 

Apps installed with the **App Fair.app** application are created using the modern platform-native `SwiftUI` framework and built for both Intel and ARM processors, and therefore tend to run faster and use resources more efficiently than other cross-platform application frameworks.
At the same time, they use modern "Sandboxing" techniques to protect your system and ensure that you are always aware of what actions the apps are permitted to take, such as reading and writing files, communicating over the internet, or accessing your camera, microphone, or other USB & bluetooth devices.

### Getting Started

The fastest way to install the App Fair catalog browser app by opening `Terminal.app` and running the following command:

```shell
curl -fsSL https://github.com/appfair/App/releases/download/App-Fair/App-Fair-macOS.zip | ditto --noqtn -x -k - /Applications/
```

 The command will download the latest release zip and install it directly into your `/Applications/` folder.
 

As an alternative means of installation, you can download and unzip the [App-Fair-macOS.zip](https://github.com/appfair/App/releases/download/App-Fair/App-Fair-macOS.zip) file directly, but note that since it is not notarized, you will need to open via the command-clicking the `App Fair.app` file and selecting the "Open…" menu.
This will have to be done *twice*, both times accepting the warning about launching an un-notarized app.

Note that once you have installed the `App Fair.app` once, further updates will take place via the App Fair itself, and you will no longer need to perform any special steps to launch the app.

## The App Fair for App Developers

App Fair apps are written in Swift and utilize a native `SwiftUI` user interface. 
Apps target macOS 12 and Swift version 5.5, giving them access to the full power of Swift's async/await concurrency features.

The distribution process for App Fair apps is completely automated, instantaneous, and free. 
The only requirement is a GitHub account that is associated with your `.edu` e-mail address.
No additional registration, sign-up, or approval is required in order to start developing and distributing apps for the App Fair.

## The App Fair fairground

The "fairground" is the name for the abstract service that acts as the platform for app distribution, and includes services for user authorization, and for validating, building, packaging, cataloging, and distributing the apps.
The "App Fair" is the reference fairground, implemented as a set of GitHub repositories, actions, and policies.
These are defined primarily in the [appfair/App](https://github.com/appfair/App) repository, which also acts as the base repository to be forked by app developers.

![fairground](assets/fairground.svg)

### Introduction: the FAIR process

"Fork-Apply-Integrate-Release" (F-A-I-R) describes the stages of creating, developing, building, and distributing an app.
The "Fork" and "Apply" parts are handled by you, the developer: a fork is created from the base [`/appfair/App`](https://github.com/appfair/App) repository, and in that fork you develop your app.
When you are ready to publish a release, you apply your changes in the form of a Pull Request (PR) back to the base `/appfair/App` repository.
The "Integrate" and "Release" phases are handled by the build host that accepts pull requests from the developer's fork and validates, builds, packages, and releases the installable app.

The integration & release phases are the central part of the "fairground" process.
These phases handle accepting incoming requests to validate and release an app.

From an App developer standpoint, an App Fair app is a Swift application that is defined by a Swift Package Manager `Package.swift` file, and that uses of two source code repositories: *Fair* & *App*:
 - [https://github.com/appfair/App](https://github.com/appfair/App) is the repository that is forked to create a new  App Fair app; PRs submitted to this repository are automatically built and released to the **App Fair.app** catalog.
 - Fair is the runtime `SwiftUI` library that is included in every App Fair project, and acts as a sandboxed container within which your application is run. The `Fair` library is the only required dependency for your app's [https://github.com/appfair/App](https://github.com/appfair/App) fork.

### "App Fair" & other distribution platforms

App Fair apps are written in Swift, a modern & safe language, compiled natively for Intel & ARM, and utilize the `SwiftUI` framework to provide a truly native application user interface.
This makes apps installed from the App Fair tend to be fast and efficient, and have the capability to utilize the full range of the platform's native frameworks.

Unlike other platform-native store-fronts, there is no application, fees, or recurring subscriptions to createm develop, and update App Fair apps, nor are there any reviews or systematic delays in issuing updates to your apps.

The App Fair's "Source Transparency" feature means that there is always visibility into exactly what code is running on your device.

## The Structure of the App Fair project

Upon submitting a [Pull Request](https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests) for your `/APP-ORG/App` fork's changes, your project will be automatically built, signed, and packaged as a native macOS application.

These releases can be browsed, searched, and installed using the macOS the **App Fair.app** catalog browser application, which acts as the hub for discovering, researching, installing, and updating apps.

The process is completely automated, instantaneous, and free. 
Provided you have a free GitHubAccount, no additional registration, sign-up, or approval is required in order to start developing App Fair apps.

## The Structure of an App Fair app

### App Organization 

Your App is represented uniquely by a GitHub Organization, so the first step is to [create a new free organization](https://github.com/account/organizations/new). 
The organization name must be a two hyphen-separated words using only characters that are legal in URL paths. 
For example, the GitHub organization for the **App Fair.app** catalog browser application itself is [https://github.com/App-Fair/](https://github.com/App-Fair/).

Your app organization can be structured however you want, and can consist of a team of as few or as many as you like. 
You can manage create and distribute multiple apps by creating multiple separate organizations. 

### App Repository

Once your organization is set up, you create your your `/APP-ORG/App` project by forking the [https://github.com/appfair/App](https://github.com/appfair/App) repository into your new organization name.
This is a Swift project that contains the shell of a cross-platform `SwiftUI` app that you will use as your starting point.

Your app will exist in a top-level repository named "App"; it must continue to be called "App", since that is how the catalog browser will be able to access your project metadata.

For more information on the fork process, see: [Working with forks](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/working-with-forks).

### Developing your `/APP-ORG/App` fork

The `/APP-ORG/App` repository is structured as a standard swift package, and includes the following code that must be included as the scaffold and starting point for your app:

  * Package.swift
  * Sources/App/AppMain.swift
  * Sources/App/AppContainer.swift
  * Tests/AppTests/AppTests.swift

In addition, at the top level of the repository, there are `Xcode`-specific project files that describe the metadata, build rules, assets, and permissions for the project:

  * `App.xcworkspace` – Xcode workspace file for running and debugging your app
  * `App.xcodeproj` – Xcode-specific metadata
  * `Info.plist` – metadata about your app
  * `Sandbox.entitlements` – permissions that should be granted to your app
  * `Assets.xcassets` – the app's icon and tint

App development can be done by opening `App.xcworkspace` using `Xcode.app` to build, run, and debug the `SwiftUI` app that is defined in `Sources/App/AppContainer.swift`.
Note, though, that changes to these project files, `App.xcworkspace` and `App.xcodeproj`, will *not* be incorporated into the final project.
It will be best not to make changes to the project files themselves, since none of the changes will be used in the eventual `integrate-release` phases of the process.

### Managing dependencies in your `/APP-ORG/App` fork

The `Package.swift` file that defines how your package is built.
Only the dependencies section of this file can be edited to add your swift package dependencies.
The section of the `Package.swift` file that can be altered is marked with the comment:

```swift
// Everything above this line must remain unmodified.
```

This restriction is enforced by the `Integration` phase of the process, which will refuse to build the project if the fenced areas have been modified.

### AppContainer.swift and AppMain.swift

The `Sources/App/AppMain.swift` is the entry point to your app on all available platforms.
The contents of the file must not be changed, or validation of your project will fail at the `integrate` phase.

To customize your app, you should instead start by editing the `AppContainer` extension in `Sources/App/AppContainer.swift` to provide the required protocol implementations for your app's root view.


### The App Fair sandbox

The "sandbox" is the name for a security environment within which a program is run that restricts the capabilities of the software.
Your `/APP-ORG/App` fork is pre-configured to request minimal permissions, and thus runs in a very restrictive sandboxed environment: USB & bluetooth hardware access is not permitted, network access communication is blocked, and file access outside the app's own sandboxed container is not allowed.

You may add new entitlements to your `/APP-ORG/App` fork's `App.entitlements` file.
For each entitlement that is requested, a description of the reason for the entitlement must be added to `Info.plist`.
This is enforced by the `Integration` phase.
These descriptions should be plain language explaining why the app needs access to the specific permissions.

The descriptions will be presented to the user via the **App Fair.app** catalog browser, and the user will need to confirm that the app should be granted these permissions.
The apps may periodically remind the users of the permissions that have been granted to the app, and re-confirm with the user that the app should be granted the permissions.
This is in addition to automatic confirmations and re-confirmations that the host OS may present to the user over time.

For these reasons, you should not request permissions that your app does not need.
For example, if you are making a weather app, you should not need to request the user's microphone with the `device.microphone` entitlement.
See `AppEntitlement.usageDescriptionProperties` for the usage description property names for the corresponding `App.entitlements` keys.

## The "Fair App Integration Release" process

Once your app is ready to be released, you create a Pull Request (PR) from your Fork to the upstream [https://github.com/appfair/App](https://github.com/appfair/App) repository. 
This PR will not be merged; rather, it acts as a trigger to initiate the `Integration` and `Releases` phases of the App Fair process.
Once a release is created, it will be available at the list of releases at [https://github.com/appfair/App/releases](https://github.com/appfair/App/releases), from which it can be downloaded using the **App Fair.app** catalog browser or other compatible application.

## Validating your app with validate_app.yml

Your `/APP-ORG/App` fork will include a GitHub action at `.github/workflows/validate_app.yml` that will perform the same validations of your app's organization and metadata that the `integrate` phase will perform upon submission of an `integration` PR.
This allows you to ensure that while developing your app, all the required tests and validations continue to pass, which increases the likelihood that your app will pass the eventual `integrate-releases` phases.

All you need to do to enable that the validation action runs on every commit to your `main` branch is to enable the actions in the `Actions` tab of your `/APP-ORG/App` fork's page.

### The Fair App Integration Phase

When a pull request is submitted from your app's fork back to the origin repository at [https://github.com/appfair/App](https://github.com/appfair/App), the integration phase of the App Fair's `Fork-Apply-Integrate-Release` process is initiated.

### Configuring your Fork for the integrate-release phases

Once you have created your `/APP-ORG/App` fork

```
$ git remote -v
origin    https://github.com/APP-ORG/App.git (fetch)
origin    https://github.com/APP-ORG/App.git (push)

$ git remote add upstream https://github.com/appfair/App.git

$ git remote -v
origin      https://github.com/APP-ORG/App.git (fetch)
origin      https://github.com/APP-ORG/App.git (push)
upstream    https://github.com/appfair/App.git (fetch)
upstream    https://github.com/appfair/App.git (push)

$ git fetch upstream
remote: Enumerating objects…
remote: Counting objects…
remote: Compressing objects…
remote: Total … (delta …), reused … (delta …), pack-reused …
Unpacking objects: 100% (15/15), 1.15 KiB | 51.00 KiB/s, done.
From https://github.com/appfair/App
 
$ git pull
Current branch main is up to date.

$ git merge upstream/main
Merge made by the 'recursive' strategy.
 …/…/…     | 2 +-
 …/…/…     | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)
```

The PR will triggered a GitHub action (of type [pull_request_target](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#pull_request_target)) running on a macOS build host.
The action will check out the PR and use the `fairtool` to validate the structure of the project and verify the status of the app's organization.
It also verifies that the sandboxing requirements are met and that the project's `Package.swift` conforms to the integration requirements.
Finally, it sets the "version" of the app to be the PR's commit hash, which provides visibility into the source that was used to build any version of the app.

If validation passes, the PR will be built, packaged, and signed for all the supported platforms. Once this is successful, the app is considered to be "integrated" and thus ready for release.
See the [workflow file](https://github.com/appfair/App/blob/main/.github/workflows/release_pr.yml) for the exact details of the process.

The pull request itself can remain open, and it can be later updated (or re-opened) when a new integration is requested.

### The Fair App Release Phase

Any app that passes the integration process, and whose organization passes the validation requirements, is automatically deployed to the [appfair/App releases](https://github.com/appfair/App/releases). 

Once the app is releases, it will be visible and available for installation from the **App Fair.app** catalog for as long as the app's organization remains valid.

The [appfair/App releases](https://github.com/appfair/App/releases) contain all the current releases of all the apps that will be available in the **App Fair.app** catalog browser.

These releases contain a number of artifacts that can be accessed using any compatible catalog browser in order to provide detailed metadata about the app's release.
These release artifacts include:

  * `App-Name-macOS.zip`: the macOS application archive, which will be installed by the **App Fair.app** catalog browser. 
  * `App-Name-macOS.plist`: the metadata about the macOS application, such as the title and version
  * `App-Name-iOS.ipa`: the iOS application archives (unsigned)
  * `App-Name-iOS.plist`: the metadata about the iOS application
  * `Sandbox.entitlements`: the list of permissions the app will request, such as network or file system access
  * `App-Name-source.tgz`: the complete source code of the integration PR as well as all the resolved SPM dependencies that were used to create the release
  * `App-Name.png`: the app's icon
  * `Package.resolved`: the release versions of all the resolved SPM dependencies

(Note that in addition to these artifacts, GitHub also automatically includes a "Source code (zip)" and "Source code (tar.gz)" archive in the releases; these are 'shallow' source archives without the dependent code; for access to the complete archive of source code that was used to actually build an application, the generated `App-Name-source.tgz` release artifact should be used).


## App Fair Catalog Requirements 

The "App Fair" catalog is the list of valid app releases at [appfair/App releases](https://github.com/appfair/App/releases) cross-referenced with the metadata for the `App/` forks: issues, discussions, support info, wikis, project web site, etc.
This metadata is accumulated using the public GitHub APIs, and the appearance in the catalog is completely automated.

### Org Requirements

In order for an organization's `/APP-ORG/App` project to be visible in the **App Fair.app** catalog, it must be a public organization with at least one public member. 
The organization must have a repository (or redirection) named "App" (literally), which must be a fork of the [appfair/App](https://github.com/appfair/App) repository.
In addition, the repository must have issues & discussions enabled, and also must be public & un-archived.
Finally, the `APP-ORG` organization's public contact must be a valid e-mail address ending in ".edu".

### Licensing

The [appfair/App](https://github.com/appfair/App) repository is licensed under the GNU AGPL, which means that all forks of the project are also covered under that license. 
If you would like your app's code to be licensed differently, you can create a separate repository (either in the same organization or elsewhere; it merely needs to be publicly available on GitHub) with another license of your choosing, and then reference the project(s) from your `Package.swift` dependencies section. 
The App/Fair release process doesn't perform any validation of the licenses of any Swift dependencies; it only requires that the license for the forked `/App` project itself remain unchanged, and that all the source files that act as inputs to the build process are available for inspection and analysis at the time of building.


## App Fair Principles

The App Fair is founded on a principle of mutual respect between the creators and users of the app, as well as the app distribution itself.

## Ideal: Free

App Fair apps are always free; there is never any charge to download and install apps from the catalog, nor is there any possibility for in-app purchases or subscriptions.
Any apps you install from the App Fair will be free and fair, forever.

Some App developers may enable patronage services, which provides the ability for users to electively sponsor developers whose apps they enjoy using, as well as to fund the ongoing development of the app and encourage new features.

## Ideal: Fair

The App Fair is designed to encourage fairness and respect between software creators (the app developers), software consumers (the users of the app), and the "fairground" distribution platform (the App Fair).

### Creator-Platform-Consumer Trust Relationship

Any system of software aggregation and distribution involves three groups:

 - Consumers: the end-users of the software. These are the people that use the Platform to find, research, install, and update software on the devices.
 - Creators: the person or people that develop the software designed to be distributed to Consumers via the Platform.
 - Platform: the software processes that handle the ingestion, validation, packaging, cataloging, rating, and distribution of software from Creators to Consumers.

This guiding principles for each separate relationship in this collection is:

 - Creator-Platform: the Creators trust the distribution platform to treat them fairly. Creators should not be advantaged or disadvantaged by hidden rules implemented by the Platform. Creators should have free and unfettered control over how they add, remove, or update apps available in the Platform's catalog.

 - Consumer-Platform: the Consumers trust that the Platform will provide a safe and reliable mechanism to find, research, install, and update software. The Consumers rely on the Platform to ensure that there are reliable communication channels available for the Consumer to rely questions and concerns to the Creator.
 
<!--  - Consumer-Creator: 
 - Consumer-Platform: 
 
 - Creator-Consumer: the Creators trust that the Consumers will use their software as intended and will respect the intellectual property rights of the Creators.

 - Platform-Creator: the Platforms trust that the Creators will use their distribution 
 - Platform-Consumer:  -->

## Ideal: Forever

While apps distributed through the App Fair catalog can be removed by their creators at any time, the apps do not otherwise expire.
Once you have downloaded and installed an app, you can be confident that it will remain in its current operational state until you remove or update it.
To this end, the App Fair does not impose any automatic updating mechanism on your apps.
App updated must always be explicitly initiated by the end user.


## App Fair Security

A challenge for any application distribution platform is dealing with "badware", which can be simply defined as software with undesired effects. 
These can be merely annoying and wasteful, such as adware, containers for offensive content, covert proof-of-work crypto-currency miners, and other potentially unwanted programs ("PUPs"). 
Software can also be actively hostile, such as programs that attempt to exfiltrate your personal data and activities ("spyware") or programs that attempt to lock you out of your own data ("ransomware"). 
At the extreme end of the spectrum, programs that run on your computer can be actively dangerous to both yourself as well as the broader network: they can act as hosts for virus propagation or externally-coordinated clients for a "botnet" that can perform distributed denial of service (DDoS) attacks or other malicious activities.

Web browsers have been dealing with these risks and issues ever since the web was born.
Browsers have evolved to enable arbitrary code to be run while still protecting the user's system and privacy (to some extent) by having the untrusted code run inside a sandbox that restricts the sorts of activities that are permitted: file system access is generally restricted to cookie storage and compartmentalized local file storage APIs, and network access is typically limited to HTTP and websocket access back to the network host for the page that loaded the code.

Similarly, applications that run on most modern operating systems can be "hardened" and constrained to running in a "sandbox", which restricts the application in what it can see and do.
File system access, including access to your personal data (such as contacts, mail, and photos), require explicit consent from the user before the app can access the data.
Similarly, direct access to the local hardware (microphone, video/camera, keyboard) is constrained and also requires explicit consent.
The App Fair integration process requires that all software be hardened and sandboxed in order to be visible in, and installable from, the catalog.

### Source Transparency

The App Fair's `integrate-release` build process is completely automated; there is no individual review of apps, neither when they are initially submitted nor when updates are released.
This allows the release & update processes to be free of delays and keeps the catalog free from reviewer bias, but it also removes any possibility of pre-distribution "gate-keeping" to protect the community from unwanted programs.

The App Fair instead provides post-distribution accountability by requiring that the source code for the entire app be available to the build process and that it be hosted in publicly-available GitHub repositories.
For any release in the App Fair catalog, the complete source code is available for inspection, review, and analysis by the entire world.
This access enables the security community to use all its resources to identify, isolate, and mitigate badly-behaved apps.
In addition, a requirement that all the code be hosted in publicly-available Git repositories means that tools like [code scanning](https://docs.github.com/en/code-security/secure-coding/automatically-scanning-your-code-for-vulnerabilities-and-errors/about-code-scanning) can be used to identify security vulnerabilities in the app or any of the frameworks it embeds.

### Commit Signing

The App Fair's `integrate-release` build process signs the release's binary artifacts with an "Ad-Hoc" code signing certificate.
While this satisfies the policy requirements of certain platforms and provides some protection against tampering, this ad-hoc signature does not offer any useful identifying information.
The signature is essentially an anonymous seal on the binary placed on it by the `integrate-release` build phases.

Instead, the App Fair provides author accountability and identifiability by requiring that any commit that triggers the `integrate-release` process be cryptographically signed with the author's GPG signature.
This signature must be associated with an `.edu` (or other approved) e-mail address, and that address must be associated with user's GitHub account (although it does not need to be the primary e-mail address for the account).

Note that only the commit that creates or updates the `integrate` PR is required to be signed; other commits to the repository, or to third-party dependencies, do not need to be signed (although it is always encouraged). For this reason, it is the creator of the PR's commit that is considered to be the "author" of the app in terms of validation and accountability.

For information on setting up commit signing, see the following documentation:

  * [Signing commits](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/signing-commits)
  * [Telling git about your signing key](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/telling-git-about-your-signing-key)
  * [Associating an email with your GPG key](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/associating-an-email-with-your-gpg-key)
  * [Setting your commit email address](https://docs.github.com/en/github/setting-up-and-managing-your-github-user-account/managing-email-preferences/setting-your-commit-email-address)





# Troubleshooting & Frequently Asked Questions

## User FAQ

### Where are App Fair apps installed?

The standard install location for App Fairs apps is the `/Applications/App Fair/` folder, which exists as a peer to the `/Applications/App Fair.app` application. 
Storing apps in a sub-folder of the standard `/Applications/` folder prevents name clashes with apps installed through other distribution mechanisms.

### Can I revert to an older version of an app?

When **App Fair.app** installs an update to an existing app, it will place the older version in the user's Trash. 
As long as the trash remains un-emptied, the previous version of the app will continue to be available to drag back into the `/Applications/App Fair/` folder.
The App Fair catalog itself only references the most recent version of an app, so you must rely on your own backups (or contact the author of the app) for older versions.
Older releases may additionally be available from the archives saved from the [appfair/App/actions](https://github.com/appfair/App/actions) history; these are typically available for a short time after the release has been created. 

### How can a user delete an app installed with the **App Fair.app** catalog?

Apps can be deleted from the `/Applications/App Fair/` folder by dragging them into the Trash or deleting them directly.

App Fair apps are no different from any other installed app in this regard.

## Developer FAQ

### How do I use git and GitHub?

There are a multitude of resources availabl.
A good starting point is GitHub's [Hello World](https://guides.github.com/activities/hello-world/) tutorial.

### How do I fork the `appfair/App` repository?

Once you have set up your free `APP-ORG` organization that will represent the app, you can fork the repository by going to [https://github.com/appfair/App/fork](https://github.com/appfair/App/fork).
See the GitHub documentation: [Fork a repo](https://docs.github.com/en/get-started/quickstart/fork-a-repo).

### What versioning scheme do App Fair apps use?

App Fair apps do not use any sort of conventional version numbering scheme. Rather than a dotted-numeric identifier (such as `1.2.3`), App Fair apps are automatically versioned with a hash of the commit for the pull request that triggered the build of the app. What this means is that you can always take the version number (which you can copy & paste from Finder's `Get Info` on the app) and be able to browse the source code that went into the app's release by searching for that unique commit hash on GitHub.

### Can I have multiple versions of an app released simultaneously?

No: there is only ever a single active version of your app that is available through the [appfair/App releases](https://github.com/appfair/App/releases) (and, thus, available for installation in the **App Fair.app** catalog). 

### Can I customize my app's icon?

The default icon is automatically generated by the `fairtool` as part of the build process.

### What is the `fairtool`?

Fairtool is the name of the utility that is included with the `Fair` project, that can be used to validate a project, generate icons, and the like.
It can be run from any `/APP-ORG/App` fork from Terminal.app with the command:

```
$ swift run fairtool help
```

For details, see the [source](https://github.com/appfair/Fair/blob/main/Sources/FairApp/FairCLI.swift)

### How can I change the category of my app in the **App Fair.app** catalog?

The App Fair uses the information in your App's `Info.plist` to categorize the app in the catalog.

### Where does the **App Fair.app** catalog get its information about apps?

The catalog browser application uses the public GitHub API to list all the releases for the [appfair/App](https://github.com/appfair/App) project, which it cross-references with the list of forks for the organization information. Assets such as the localization information and icon for the app are retrieved from the releases assets.

### Can I embed API keys for online services into my App Fair app?

Any "secrets" that are included in your software, such as passwords and API keys, should be considered to be public information.
The App Fair's "Source Transparency" requirement means that every piece of data that goes into the build process of your app will also be available to the users of the app.
The presents a problem for API keys and service passwords, since there is no way to "hide" them in your code.
Sensitive information pushed to open-source repositories, such as GitHub OAuth tokens, personal access tokens, tokens from various cloud service providers, and unencrypted SSH private keys, are routinely scanned, and can be subject to automatic revocation by the organization that hosts the service.

The recommendation is that you not rely on client-side secret data to utilize your application.
When possible, the onus should be placed on the user to acquire their own token, which they can then store in the keychain or application preferences in your app.

### Can I distribute Beta or Demo versions of my app through the App Fair?

There are no restrictions on the kinds of apps that you can build and distribute on the App Fair.
The App Fair welcomes all apps: Student Projects, Experiments, Artistic and Literary works, Vanity App, Demos, Tests, and Re-Mixes of other App Fair apps.
As a completely automated system, there is no human review, so the only requirement to be included in the App Fair catalog is that it passes the automated validation phases of the `integrate-release` process.

### How can I set the description of my app in the App Fair catalog

Change the `Description` section of the repository details "About" setting.


### How can I categorize my app in the App Fair catalog

You can classify and categorize your app for the App Fair catalog by adding any two of the following to the `topics` of your `/APP-ORG/App` fork's "About" settings.
For more information, see [Adding topics to your repository](https://docs.github.com/en/github/administering-a-repository/managing-repository-settings/classifying-your-repository-with-topics#adding-topics-to-your-repository).

 - [`appfair-business`](https://github.com/topics/appfair-business)
 - [`appfair-developer-tools`](https://github.com/topics/appfair-developer-tools)
 - [`appfair-education`](https://github.com/topics/appfair-education)
 - [`appfair-entertainment`](https://github.com/topics/appfair-entertainment)
 - [`appfair-finance`](https://github.com/topics/appfair-finance)
 - [`appfair-games`](https://github.com/topics/appfair-games)
 - [`appfair-graphics-design`](https://github.com/topics/appfair-graphics-design)
 - [`appfair-healthcare-fitness`](https://github.com/topics/appfair-healthcare-fitness)
 - [`appfair-lifestyle`](https://github.com/topics/appfair-lifestyle)
 - [`appfair-medical`](https://github.com/topics/appfair-medical)
 - [`appfair-music`](https://github.com/topics/appfair-music)
 - [`appfair-news`](https://github.com/topics/appfair-news)
 - [`appfair-photography`](https://github.com/topics/appfair-photography)
 - [`appfair-productivity`](https://github.com/topics/appfair-productivity)
 - [`appfair-reference`](https://github.com/topics/appfair-reference)
 - [`appfair-social-networking`](https://github.com/topics/appfair-social-networking)
 - [`appfair-sports`](https://github.com/topics/appfair-sports)
 - [`appfair-travel`](https://github.com/topics/appfair-travel)
 - [`appfair-utilities`](https://github.com/topics/appfair-utilities)
 - [`appfair-video`](https://github.com/topics/appfair-video)
 - [`appfair-weather`](https://github.com/topics/appfair-weather)


### How is e-mail verification performed?

The GPG signature of the initiator of the `integrate-release` pull request must be for an `.edu` e-mail address and the commit must be [verified](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/about-commit-signature-verification).

You must have a valid e-mail address configured in your list of keys in your [GPG keys settings](https://github.com/settings/keys)


### Can I distribute my app using other distribution channels?

You have complete control over how you distribute your App Fair apps.
Your app's binary package can be hosted as a direct download on your web site, which side-steps the need for users to install the the **App Fair.app** catalog browser application in order to use your app.
Note, however, that since the app is not "notarized", any direct download will require the user to perform some manual steps in order to launch the app: on macOS, they must right-click (or command-click) on the `.app` file and select "Open…" and accept a warning dialog.
The user must do this **twice** in order to run the app when it has been downloaded directly from a web site.

You are also free to release your App Fair apps through any other distribution network or store-front of your choosing, subject to the rules and restrictions of those channels.

### How can I monetize my app?

Apps available through the **App Fair.app** catalog browser application are always free.
Activating GitHub sponsorships will enable your account to accept financial contributions to your project through any of the supported funding model platforms.
When sponsorships are enabled, your app's container will automatically add a Help menu link to the sponsorship service.

For more information about enabling sponsorships for your app, see [Displaying a sponsor button in your repository](https://docs.github.com/en/github/administering-a-repository/managing-repository-settings/displaying-a-sponsor-button-in-your-repository).

### How can I remove my app from the App Fair catalog?

The simplest way to remove your app from showing up in the **App Fair.app** catalog is to mark your repository or organization as "private", or else archive (or delete) your organization's `/APP-ORG/App` fork.

In addition, disabling issues or discussions for your `/APP-ORG/App` fork will also have the result of making your app no longer appear as a valid installation candidate in the **App Fair.app** catalog.
Discussions and issues are required in order to allow users a channel for support questions and other communications.

### How can I have someone else's app removed from the App Fair?

As the App Fair's `integrate-release` process is completely automated, there is no mechanism for direct management of, or intervention in, the app release process. 
Each app that is listed in that app's github repository, which is required to have issues and discussions enabled.
You can use these forums to contact the developer(s) of the app.
Organizations that are removed from GitHub will have the effect of removing that organization's app from being visible or installable from the **App Fair.app** catalog.

### Can App Fair apps be installed on non-macOS platforms?

The integration phase of the App Fair builds and packages all apps for both macOS and iOS, but the **App Fair.app** catalog browser is currently only available for macOS 12 on ARM & Intel processors.

### Why do apps need to target both macOS and iOS?

The integration phase of the App Fair process will build your app's fork for both macOS and iOS, even though they are currently only installable using the macOS **App Fair.app** catalog browser application. 
This is in order to be able to run your app's unit tests in a sandboxed environment, as well as automatically generating screenshots for users to preview in a catalog browser.

### What is the target OS for App Fair applications

In order to be able to utilize the Swift 5.5 concurrency features (async/await & actors), App Fair apps target macOS 12 and iOS 15.
Note that the [Fair/FairCore](https://github.com/appfair/Fair/tree/main/Sources/FairCore) target is compatible with Swift 5.4 in order to use macOS 11 as the build host.

### Can I build a watchOS or tvOS app?

No. Only macOS and iOS builds are currently supported. 

### Can I use the release artifacts with other distribution channels

The binaries created by the `integrate-release` phase are standard `.zip` and `.ipa` archives and should be suitable for distributing via any compatible app distribution mechanisms.
The release artifacts at [appfair/App releases](https://github.com/appfair/App/releases) are not constrained in how they are distributed or used.

### Which native frameworks will my app be able to use?

As a native compiled Swift application, App Fair apps can link to any native system framework on their target host.
However, certain frameworks that integrate with online components (typically those that utilize cloud services) will not function at runtime when they are used from apps that are distributed without a paid developer subscription.
For example, online geo-location services (used by the MapKit framework) and speech recognition services (used by the Natural Language framework) are unavailable to apps that are distributed through free channels.

In general, frameworks that only utilize local system resources can be used without issue in App Fair apps.
Note that any frameworks your app depends on must be available for both `macOS` and `iOS`.

### What kinds of source files can I include with my app?

The App Fair's `integrate-release` process uses the [Swift Package Manager (SPM)](https://swift.org/package-manager/) tool for building both your `/APP-ORG/App` fork, as well as all the third-party dependencies.
SPM is focused primarily on the Swift language, but it can be used to build a wide variety of source.
Note that binary dependencies are not permitted in the `Package.swift` build file; the App Fair requires that all source code that goes into the app be available during the build process.

### Can I load executable code at runtime

Except for Just-in-Time compilation, the `Sandbox.entitlements` forbids the dynamic loading of unsigned executable code at runtime.

### How large are App Fair apps?

Since they use the built-in native frameworks included with the host OS, App Fair apps are generally smaller than those built with cross-platform technologies that need to embed large components. An App Fair app's download size can be under 1 megabyte. There is a 100 megabyte limit to the size of app that will be deployed in the `integrate-release` phases.

### Will App Fair apps auto-update

There is currently no auto-updating feature in the App Fair.
App updates must be installed manually and individually from the **App Fair.app** catalog browser application.

### What permissions am I permitted to use in `Sandbox.entitlements`

Your app may request any permission in the `Sandbox.entitlements` with the exception of the following permissions:

 - `files.all`
 - `cs.allow-unsigned-executable-memory`
 - `cs.allow-dyld-environment-variables`
 - `cs.disable-library-validation`
 - `cs.disable-executable-page-protection`

Note, however, that any permission you request must have a corresponding `usageDescriptionProperties` in the `Info.plist` metadata file explaining to the user (via the listing in the App Fair catalog) why the entitlement is requested.

### Can I change the permissions in `Sandbox.entitlements` for an update?

No. 
When installing an app, users are presented with the list of entitlements that the app will request, such as file or network permissions, or access to hardware devices. 
These permissions are considered fundamental to the trust relationship between the app's user and the app's developer.

Since changing the permissions the app is granted alters the terms of this trust relationship, the App Fair will not update an app whose `Sandbox.entitlements` have changes from the time the app was installed.
Users will need to first manually un-install the app in order to then manually install the updated version of the app in order to get the app with the new entitlements.

### Can I distribute an Electron-style JavaScript app?

The shell of the App you write, including any top-level system menus, must utilize `SwiftUI` views, idioms, and commands.
Embedding a binary framework, such as the Chromium rendering engine and the Node.js runtime that together power Electron apps, is not supported.
However, there is nothing preventing you from embedding any arbitrary native view controller within your app's view hierarchy, such as the `WKWebView` that enables apps to host an HTML5 application within a Safari-like container.

### Can I build my App Fair app using Mac Catalyst?

No.
App Fair apps are cross-platform and must use the native user-interface toolkit for their respective platform (AppKit on macOS and UIKit on iOS).
Using `SwiftUI` makes this mostly transparent to the developer.

### Can I build my App Fair app using Qt?

No.

### Do I need a Mac to develop App Fair apps?

*Technically*, no: you could theoretically use any OS to write the Swift code for your `/APP-ORG/App` fork.
Since the Integration and Release phases of the App Fair process are all run in the cloud, no client-side build & run activity is required.

In practice, however, to develop anything but the most trivial of apps requires being able to use a modern IDE, debugger, and the ability to actually run your app in order to test and refine the behavior.

### Why is my `integrate` pull request never merged?

Your `integrate` PRs are not intended to ever be merged into the [appfair/App](https://github.com/appfair/App/pulls) repository.
Rather, they are required merely to trigger the `pull_request_target` GitHub action that initiates the `integrate-release` phases.

### Are App Fair apps signed?

Yes. 
As of macOS 12, all apps must be signed in order to run on every native architecture.
The same requirement exists for iOS.
The `Integrate` phase of the App Fair process signs the app with an "ad-hoc" signing certificate in order to satisfy this requirement.

### What is "Ad-Hoc" code signing?

When an app is "signed", it protects the app from being tampered with once it has been installed.
When a signature is "Ad-Hoc", it means that there is no identifying information associated with the signature.

### Are App Fair apps notarized?

Although App Fair apps are signed, sandboxed, and utilize the hardened runtime, they are not automatically notarized during the fairground's `integrate-release` phases. 
Notarization requires a recurring paid developer subscription (and the ongoing acceptance of terms & conditions) and is therefore incompatible with the free & fair nature of the App Fair.

If you have a paid developer subscription, you are free to notarize the App Fair release binaries for your app yourself, which will enable you to distribute the same binary both via **App Fair.app** catalog browser application and via other distribution channels.

### What can I change in the Package.swift file?

The `Package.swift` for your `/APP-ORG/App` fork is expected to conform to the structural conventions of App Fair apps.
As such, the outline of the `Package.swift` file cannot be changed, but some of the elements, such as the package dependencies, can be edited.
These requirements are enforces with a number of `precondition` statements at the end of the `Package.swift` file; these must not be removed or altered.

Note that these restrictions only apply to the `Package.swift` in the `/APP-ORG/App` fork itself, and not to the `Package.swift` for any dependent packages.
The App Fair does not analyze any of your transitive dependences other than to enforce that they do not include binary targets, so any valid SPM `Package.swift` can be used as a dependency, provided it is available for both `macOS` and `iOS`.

### My app's code mostly resides in an external Package. How can I make a release when only the dependent package has changed?

The App Fair's `integrate-release` phases are triggered by Pull Request that are made from your `/APP-ORG/App` fork.
So in order to create a new release, something in your `/APP-ORG/App` fork will need to change before a Pull Request can be created.
One possible change to make would be to increment the version of the dependent library in your `Package.swift` file, and use that change to issue the PR.

### What prevents malicious apps from being distributed through the App Fair?

App Fair apps are sandboxed, which prevents them from accessing files that are not explicitly granted authorization from the user.
This helps to contain any damage that may be caused by a malicious (or merely poorly-written) application.

Along with this preventative protection, the system also provides multiple independent remedial protections agains bad actors:

macOS includes built-in antivirus technology called "XProtect" for the signature-based detection of malware, which is updated regularly with signatures of new malware infections and strains.

Furthermore, macOS also includes the "Malware Removal Tool" (MRT), which is a process that remediates infections based on automatic updates of system data files and security information. 
MRT removes malware upon receiving updated information, and it continues to check for infections on restart and login.

### What is the License for the App Fair project?

Both the [appfair/Fair](https://github.com/appfair/Fair) and [appfair/App](https://github.com/appfair/App) projects, as well as all forks thereof (including the [**App Fair.app** catalog browser application](https://github.com/App-Fair/)), are licensed under the [GNU Affero General Public License](https://www.gnu.org/licenses/agpl-3.0.html).

### Is my app code required to use the AGPL?

Only the portion of your app contained in your app organization's `/APP-ORG/App` fork is required to be covered by the AGPL.
You can develop any portion of your app in a separate repository, which can be covered by any license of your choosing (provided the source code is available during the fairground's `integrate-release` phases).



## FairGround FAQ

### Can I make my own FairGround?

The "App Fair" is the reference implementation of a fairground, using a model of non-commercial copyleft open-source projects that mandate source transparency and explicit security entitlements.
Alternative fairground models are possible by simply mirroring the structure and repositories of the `appfair` organization.
The bulk of the fairground's logic is in the `Fair` library, which you can customize to handle any custom rules for your implementation.

## How is the FairGround's catalog updated?

The "App Fair" reference implementation has a special [catalog tag](https://github.com/appfair/App/releases/tag/catalog).
This tag is updated with a new `catalog.json` file after every successful `integrate-release` run.
The `catalog.json` file is the manifest of all the current and valid apps that can be downloaded using a catalog browser.


## Troubleshooting

### Debugging a failed integration 

Once you submit your PR your `/APP-ORG/App` fork ([/appfair/App/pulls](https://github.com/appfair/App/pulls)), the App Fair's `integrate-release` process is initiated with an action: [/appfair/App/actions](https://github.com/appfair/App/actions).
This process verifies, builds, and tests your app using an action that is outside of your control.
This means that care must be taken to keep the build process working as expected.
Notably, you should not make changes to the template file `Sources/App/AppMai.swift` (where modifications are explicitly prohibited), nor should you make major changes to the Xcode project files (since any changes will be ignored by the `integrate` build process).

When a failure occurs in the `integrate-release` phases, you will typically get an e-mail (contingent on your GitHub notification settings).
The first place you should look is at the log for the [/appfair/App/actions](https://github.com/appfair/App/actions) that corresponds to your PR (which you should title with your App's identifier).
The log will identify most common issues, such as an invalid license or e-mail address.

You can also perform validation of your app by running the `fairtool` yourself.
This utility is automatically included with every app that uses the `FairApp` SPM package.
To validate the package using `Terminal.app` for the current directory of the `APP-ORG` organization name, you can run the following (replacing "APP-ORG" with your organization's name):

```
swift run -- fairtool validate --verbose true --hub github.com/appfair --org APP-ORG --project .
```

This command will check both the structure and contents of the current package, as well as check the proper configuration for the `APP-ORG` project.
Note that this is exactly the same process that the `integrate` phase executes, so using the `fairtool` is a good validation test to run yourself before creating or updating an existing PR.

# Appendix

## App Fair Distribution Checklist

Use this checklist to ensure that your app is set up properly for distribution in the App Fair catalog.

### App Organization

 - [ ]  Does `App-Org` consist of two short distinct words separated by a hyphen?


### User Account

 - [ ]  Do you have a valid (i.e., `.edu`) e-mail address set and verified in your [email settings](https://github.com/settings/emails)
 - [ ]  Is "Keep my email addresses private" turned off in your [email settings](https://github.com/settings/emails)
 - [ ]  Do you have [vigilant mode](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/displaying-verification-statuses-for-all-of-your-commits#enabling-vigilant-mode) enabled?
 
### Forked `/App` Repository

 - [ ]  Is your forked repository *publicly* accessible at: `https://github.com/App-Org/App/`?
 - [ ]  Is your `/App` fork public?
 - [ ]  Is your `/App` fork not disabled?
 - [ ]  Is your `/App` fork not archived?
 - [ ]  Does your `/App` fork have issues enabled?
 - [ ]  Does your `/App` fork have discussions enabled?
 - [ ]  Does your `/App` fork use the AGPL-3.0 license?

### Source Code

 - [ ]  Is the project name in `Package.swift` the same as the `App-Org`?
 - [ ]  Is the `Fair` library the first entry in your app's dependencies list?
 - [ ]  Is the `Sources/App/AppMain.swift` file unmodified from the origin?

### Metadata

 - [ ]  Does your app have a version?
 - [ ]  Does your app have an icon?
 - [ ]  Does your `Info.plist` have `*UsageDescription` properties for each entitlement sought in `Sandbox.entitlements`?
 
### Pull Request

 - [ ]  Is the title of your Pull Request formatted as: `App-Org v1.2.3`?
 - [ ]  Does the title of your PR match the version in `Info.plist`
 - [ ]  Is your Pull Request commit "verified" by GitHub
 - [ ]  Is the e-mail address associated with the commit valid (e.g., an `.edu` address)?
 