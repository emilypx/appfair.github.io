---
name: AppFair
title: The App Fair
---

# Welcome to the App Fair

<img align="right" width="250" alt="App Fair Icon for https://www.appfair.net" src="appfair-icon.svg" />

The App Fair is an independent app distribution platform for free open-source macOS (12) applications created by students and educators.
App Fair apps use modern native frameworks and user-interface elements with a focus on performance, efficiency, accessibility and inclusiveness.

## The App Fair for App Users

From an end-user standpoint, the **App Fair.app** catalog browser application allows you to research, discover, install, and update applications from an unlimited online collection. 

Apps installed with the **App Fair.app** application are created using the modern platform-native `SwiftUI` framework and built for both Intel and ARM processors, and therefore tend to run faster and use resources more efficiently than other cross-platform application frameworks.
At the same time, they use modern "Sandboxing" techniques to protect your system and ensure that you are always aware of what actions the apps are permitted to take, such as reading and writing files, communicating over the internet, or accessing your camera, microphone, or other USB & bluetooth devices.

### Getting Started

The App Fair catalog browser app can be installed on macOS 12 is by launching `Terminal.app` and entering the following command:

```shell
curl -fsSL https://github.com/appfair/App/releases/download/App-Fair/App-Fair-macOS.zip | ditto --noqtn -x -k - /Applications/
```

 The command will download the latest release zip and install it directly into your `/Applications/` folder.
 From there, you can launch the **App Fair.app** catalog browser application to start searching for apps.
 
As an alternative means of installation, you can download and unzip the [App-Fair-macOS.zip](https://github.com/appfair/App/releases/download/App-Fair/App-Fair-macOS.zip) file directly.
Since the `App Fair.app` app is not "notarized", you will need to first launch it by command-clicking the app and then selecting the "Open…" menu item.
This will have to be done *twice*, both times accepting the warning about launching an un-notarized app.

Note that once you have installed and launched the `App Fair.app` a first time, subsequent updates will take place via the App Fair itself, and you will no longer need to perform any special steps to launch the app.

## The App Fair for App Developers

App Fair apps are written in Swift and utilize a native `SwiftUI` user interface. 
Apps target macOS 12 and Swift version 5.5, giving them access to the full power of Swift's async/await concurrency features.

The distribution process for App Fair apps is completely automated, instantaneous, and free. 
The only requirement is a GitHub account that is associated with your `.edu` or `.ac.uk` e-mail address.
No additional registration, sign-up, or approval is required in order to start developing and distributing apps for the App Fair.

## The App Fair fair-ground

The "fair-ground" is the name for the abstract service that acts as the platform for app distribution, and includes services for user authorization, and for validating, building, packaging, cataloging, and distributing the apps.
The "App Fair" is the reference fair-ground, implemented as a set of GitHub repositories, actions, and policies.
These are defined primarily in the [appfair/App](https://github.com/appfair/App) repository, which also acts as the base repository to be forked by app developers.

### Introduction: the FAIR process

<img align="left" width="450" alt="Diagram of the App Fair process" src="assets/fairground.svg" />

"Fork-Apply-Integrate-Release" (F-A-I-R) describes the stages of creating, developing, building, and distributing an app.
The "Fork" and "Apply" parts are handled by you, the developer: a fork is created from the base [`/appfair/App`](https://github.com/appfair/App) repository, and in that fork you develop your app.
When you are ready to publish a release, you apply your changes in the form of a Pull Request (PR) back to the base `/appfair/App` repository.
The "Integrate" and "Release" phases are handled by the build host that accepts pull requests from the developer's fork and validates, builds, packages, and releases the installable app.

The integration phases is the trusted core of the "fair-ground" process.
This phase handles accepting incoming pull requests to validate, build, and package an app.
The `integrate` phase is where usage policies are enforced (to the extent permissible by automation) and where security entitlements are verified.
Finally, the app is packaged, signed, and archived.

The final phase, the `release` phase, involves the cataloging of the artifacts from the `integrate` phase and making that catalog available to a compliant catalog browser application (such as the macOS **App Fair.app** catalog browser application).

From an App developer standpoint, an App Fair app is a Swift application that is defined by a Swift Package Manager `Package.swift` file, and that uses of two source code repositories: *Fair* & *App*:
 - [https://github.com/appfair/App](https://github.com/appfair/App) is the repository that is forked to create a new  App Fair app; PRs submitted to this repository are automatically built and released to the **App Fair.app** catalog.
 - Fair is the runtime `SwiftUI` library that is included in every App Fair project, and acts as a sandboxed container within which your application is run. The `Fair` library is the only required dependency for your app's [https://github.com/appfair/App](https://github.com/appfair/App) fork.

## The Integrate Pull Request

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

### The Fair Library

The [https://github.com/appfair/Fair.git](https://github.com/appfair/Fair.git) repository is the cornerstone for the App Fair.
Fair contains the code for the following aspects of a fair-ground:

1. Managing the fair-ground process (app validation and catalog management) using the `fairtool` executable target running on the fair-ground's build host
2. Serving as the canonical source for the contents of the fair-ground's base repository, such as the App Fair's at: [https://github.com/appfair/App.git](https://github.com/appfair/App.git)
3. Acting as the point of entry to an app's launch, thereby providing automatic runtime features such as integration with the fair-ground's catalog management and runtime security checks

All apps distributed through a fair-ground such as the App Fair much include the HEAD of the `Fair` library as their initial dependency.
This ensures that all integrated apps are always up-to-date with respect to feature improvements, bug fixes, and security enhancements that may be made to the container environment.
This requirement is enforced during the `integrate-release` phase

### The App Fair sandbox

The "sandbox" is the name for a security environment within which a program is run that restricts the capabilities of the software.
Your `/APP-ORG/App` fork is pre-configured to request minimal permissions, and thus runs in a very restrictive sandboxed environment: USB & bluetooth hardware access is not permitted, network access communication is blocked, and file access outside the app's own sandboxed container is not allowed.

You may add new entitlements to your `/APP-ORG/App` fork's `Sandbox.entitlements` file.
For each entitlement that is requested, a description of the reason for the entitlement must be added to `Info.plist`.
This is enforced by the `Integration` phase.
These descriptions should be plain language explaining why the app needs access to the specific permissions.

The descriptions will be presented to the user via the **App Fair.app** catalog browser, and the user will need to confirm that the app should be granted these permissions.
The apps may periodically remind the users of the permissions that have been granted to the app, and re-confirm with the user that the app should be granted the permissions.
This is in addition to automatic confirmations and re-confirmations that the host OS may present to the user over time.

For these reasons, you should not request permissions that your app does not need.
For example, if you are making a weather app, you should not need to request the user's microphone with the `device.microphone` entitlement.

#### Entitlement Usage Descriptions

The following `AppEntitlement.usageDescriptionProperties` are the properties for the `Info.plist` metadata that corresponds to the `Sandbox.entitlements` keys:

 * `FairAppDebugger`: permits application to act as a debugger (`*.cs.debugger`) 
 * `FairAppNetworkCientUsageDescription`: enables network access, both local and internet (`*.network.client`)
 * `FairAppNetworkServerUsageDescription`: enabled the app to listen on ports and receive connections (`*.network.server`)
 * `FairAppFilesUserSelectedReadWriteUsageDescription`: allows the app to read and write files that the user has explicitly granted authorization to (`*.files.user-selected-read- write`)
 * `FairAppFilesUserSelectedReadOnlyUsageDescription`: allows the app read-only access to the files that user has explicitly granted authorization to (`*.files.user-selected-read-only`)
 * `FairAppFilesUserSelectedExecutableUsageDescription`: `*.security.files.user-selected.executable`
 * `FairAppPrintUsageDescription`: `*.security.print`
 * `FairAppScriptingTargetsUsageDescription`: `*.security.scripting-targets`
 * `FairAppApplicationGroupsUsageDescription`: `*.security.application-groups`
 * `FairAppFilesDownloadsReadOnlyUsageDescription`: `*.security.files.downloads.read-only`
 * `FairAppFilesDownloadsReadWriteUsageDescription`: `*.security.files.downloads.read-write`
 * `FairAppFilesBookmarksAppScopeUsageDescription`: `*.security.files.bookmarks.app-scope`
 * `FairAppFilesBookmarksDocumentScopeUsageDescription`: `*.security.files.bookmarks.document-scope`
 * `FairAppFilesHomeRelativePathReadOnlyUsageDescription`: `*.security.temporary-exception.files.home-relative-path.read-only`
 * `FairAppFilesHomeRelativePathReadWriteUsageDescription`: `*.security.temporary-exception.files.home-relative-path.read-write`
 * `FairAppFilesAbsolutePathReadOnlyUsageDescription`: `*.security.temporary-exception.files.absolute-path.read-only`
 * `FairAppFilesAbsolutePathReadWriteUsageDescription`: `*.security.temporary-exception.files.absolute-path.read-write`
 * `FairAppAssetsPicturesReadOnlyUsageDescription`: `*.security.assets.pictures.read-only`
 * `FairAppAssetsPicturesReadWriteUsageDescription`: `*.security.assets.pictures.read-write`
 * `FairAppAssetsMusicReadOnlyUsageDescription`: `*.security.assets.music.read-only`
 * `FairAppAssetsMusicReadWriteUsageDescription`: `*.security.assets.music.read-write`
 * `FairAppAssetsMoviesReadOnlyUsageDescription`: `*.security.assets.movies.read-only`
 * `FairAppAssetsMoviesReadWriteUsageDescription`: `*.security.assets.movies.read-write`
 * `FairAppPersonalInformationLocationUsageDescription`: `*.security.personal-information.location`
 * `FairAppPersonalInformationAddressbookUsageDescription`: `*.security.personal-information.addressbook`
 * `FairAppPersonalInformationCalendarsUsageDescription`: `*.security.personal-information.calendars`
 * `FairAppDeviceCameraUsageDescription`: `*.security.device.camera`
 * `FairAppDeviceMicrophoneUsageDescription`: `*.security.device.microphone`
 * `FairAppDeviceUsbUsageDescription`: `*.security.device.usb`
 * `FairAppDeviceSerialUsageDescription`: `*.security.device.serial`
 * `FairAppDeviceFirewireUsageDescription`: `*.security.device.firewire`
 * `FairAppDeviceBluetoothUsageDescription`: `*.security.device.bluetooth`
 * `FairAppDeviceAudioInputUsageDescription`: `*.security.device.audio-input`
 * `FairAppDeviceAudioVideoBridgingUsageDescription`: `*.security.device.audio-video-bridging`
 * `FairAppAppleEventsUsageDescription`: `*.security.temporary-exception.apple-events`
 * `FairAppAudioUnitHostUsageDescription`: `*.security.temporary-exception.audio-unit-host`
 * `FairAppIokitUserClientClassUsageDescription`: `*.security.temporary-exception.iokit-user-client-class`
 * `FairAppMachLookupGlobalNameUsageDescription`: `*.security.temporary-exception.mach-lookup.global-name`
 * `FairAppMachRegisterGlobalNameUsageDescription`: `*.security.temporary-exception.mach-register.global-name`
 * `FairAppSharedPreferenceReadOnlyUsageDescription`: `*.security.temporary-exception.shared-preference.read-only`
 * `FairAppSharedPreferenceReadWriteUsageDescription`: `*.security.temporary-exception.shared-preference.read-write`

## The "Fair App Integration Release" process

Once your app is ready to be released, you create a Pull Request (PR) from your Fork to the upstream [https://github.com/appfair/App](https://github.com/appfair/App) repository. 
This PR will not be merged; rather, it acts as a trigger to initiate the `Integration` and `Releases` phases of the App Fair process.
Once a release is created, it will be available at the list of releases at [https://github.com/appfair/App/releases](https://github.com/appfair/App/releases), from which it can be downloaded using the **App Fair.app** catalog browser or other compatible application.

### The Fair App Integration Phase

When a pull request is submitted from your app's fork back to the origin repository at [https://github.com/appfair/App](https://github.com/appfair/App), the integration phase of the App Fair's `Fork-Apply-Integrate-Release` process is initiated.

### Configuring your Fork for the integrate-release phases

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

### Validating your app with validate_app.yml

Your `/APP-ORG/App` fork will include a GitHub action at `.github/workflows/validate_app.yml` that will perform the same validations of your app's organization and metadata that the `integrate` phase will perform upon submission of an `integration` PR.
This allows you to ensure that while developing your app, all the required tests and validations continue to pass, which increases the likelihood that your app will pass the eventual `integrate-releases` phases.

All you need to do to enable that the validation action runs on every commit to your `main` branch is to enable the actions in the `Actions` tab of your `/APP-ORG/App` fork's page.


# The App Fair Catalog

## App Fair Catalog Requirements 

The "App Fair" catalog is the list of valid app releases at [appfair/App releases](https://github.com/appfair/App/releases) cross-referenced with the metadata for the `App/` forks: issues, discussions, support info, wikis, project web site, etc.
This metadata is accumulated using the public GitHub APIs, and the appearance in the catalog is completely automated.

### Org Requirements

In order for an organization's `/APP-ORG/App` project to be visible in the **App Fair.app** catalog, it must be a public organization with at least one public member. 
The organization must have a repository (or redirection) named "App" (literally), which must be a fork of the [appfair/App](https://github.com/appfair/App) repository.
In addition, the repository must have issues & discussions enabled, and also must be public & un-archived.
Finally, the `APP-ORG` organization's public contact must be a valid e-mail address ending in ".edu" or ".ac.uk".

### Licensing

The [appfair/App](https://github.com/appfair/App) repository is licensed under the GNU AGPL, which means that all forks of the project are also covered under that license. 
If you would like your app's code to be licensed differently, you can create a separate repository (either in the same organization or elsewhere; it merely needs to be publicly available on GitHub) with another license of your choosing, and then reference the project(s) from your `Package.swift` dependencies section. 
The App/Fair release process doesn't perform any validation of the licenses of any Swift dependencies; it only requires that the license for the forked `/App` project itself remain unchanged, and that all the source files that act as inputs to the build process are available for inspection and analysis at the time of building.

## Catalog Format

The App Fair "catalog" is simply a JSON file located at [https://github.com/appfair/App/releases/download/catalog/fairapps.json](https://github.com/appfair/App/releases/download/catalog/fairapps.json).
This catalog file is re-generated by the `integrate-release` process after each successful release.
The JSON file is downloaded by the **App Fair.app** catalog browser application, and can be used by other catalog apps that conform to the same format.

An example of a single app entry in the catalog JSON follows.

```json
{
  "identifier" : "appfair",
  "name" : "appfair",
  "apps" : [
    {
      "name" : "App Fair",
      "developerName" : "appfair",
      "bundleIdentifier" : "app.App-Fair",
      "version" : "1.0.0",
      "localizedDescription" : "The App Fair catalog browser app",
      "size" : 1161843,
      "versionDate" : "2019-04-04T21:45:44Z",
      "iconURL" : "https://github.com/appfair/App/releases/download/App-Fair/App-Fair.png",
      "downloadURL" : "https://github.com/appfair/App/releases/download/App-Fair/App-Fair-macOS.zip",
      "screenshotURLs" : [
        "https://github.com/appfair/App/releases/download/App-Fair/…"
      ]
    }
  ]
}
```

The catalog is constructed from the list of all the [forks of the appfair/App](https://github.com/appfair/App/network/members) who have passed the `integrate-release` phases and have an [artifact for download](https://github.com/appfair/App/releases) and whose organizations are valid (e.g., have a valid app name and have issues & discussions enabled).
The catalog creation is completely automatic.

Note that the same app will appear twice if it targets multiple operating systems with different binary artifact formats (e.g., `.zip` and `.ipa`).

The full structure of the `fairapps.json` file is:

![faircatalog-FairCatalog](assets/faircatalog-FairCatalog.svg)
![faircatalog-AppRelease](assets/faircatalog-AppRelease.svg)
![faircatalog-NewsPost](assets/faircatalog-NewsPost.svg)

# Principles of the App Fair

The App Fair is founded on a principle of mutual respect between the creators and users of the app, as well as the app distribution itself.

## Ideal: Free

App Fair apps are always free; there is never any charge to download and install apps from the catalog, nor is there any possibility for in-app purchases or subscriptions.
Any apps you install from the App Fair will be free and fair, forever.

Some App developers may enable patronage services, which provides the ability for users to electively sponsor developers whose apps they enjoy using, as well as to fund the ongoing development of the app and encourage new features.

## Ideal: Fair

The App Fair is designed to encourage fairness and respect between software creators (the app developers), software consumers (the users of the app), and the "fair-ground" distribution platform (the App Fair).

### Creator-Platform-Consumer Trust Relationship

Any system of software aggregation and distribution involves three groups:

 - Consumers: the end-users of the software. These are the people that use the Platform to find, research, install, and update software on the devices.
 - Creators: the person or people that develop the software designed to be distributed to Consumers via the Platform.
 - Platform: the software processes that handle the ingestion, validation, packaging, cataloging, rating, and distribution of software from Creators to Consumers.

This guiding principles for each separate relationship in this collection is:

 - Creator-Platform: the Creators trust the distribution platform to treat them fairly. Creators should not be advantaged or disadvantaged by hidden rules implemented by the Platform. Creators should have free and unfettered control over how they add, remove, or update apps available in the Platform's catalog.

 - Consumer-Platform: the Consumers trust that the Platform will provide a safe and reliable mechanism to find, research, install, and update software. The Consumers rely on the Platform to ensure that there are reliable and accountable communication channels available for the Consumer to relay questions and concerns to the Creator.
 
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

### Commit Signing & Verification

The App Fair's `integrate-release` build process signs the release's binary artifacts with an "Ad-Hoc" code signing certificate.
While this satisfies the policy requirements of certain platforms and provides some protection against tampering, this ad-hoc signature does not offer any useful identifying information.
The signature is essentially an anonymous seal on the binary placed on it by the `integrate-release` build phases.

Instead, the App Fair provides author accountability and identifiability by requiring that any commit that triggers the `integrate-release` process needs to be marked as `verified` by GitHub.
This means that the commit itself is cryptographically signed.
This signature must be associated with an academic e-mail address, and that address must be associated with user's GitHub account.
The academic address does not need to be the primary address for the user, but it does need to be listed in the developer's validated public e-mail addresses at [https://github.com/settings/profile](https://github.com/settings/profile).

The simplest way to sign your PR commit is to simply use the GitHub web interface whenever you update your PR to trigger the `integrate-release` phases.
GitHub will mark any commit that you make using their web interface as being "verified" with whichever of the e-mail addresses you have configured with them.

Alternatively, you can sign commits from the `Terminal.app` using the `gpg` tool, which you can install using `homebrew`.
This will enable you to update your PR from the terminal, but is considerably more complex to set up.
For information on setting up commit signing, see the following documentation:

  * [Signing commits](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/signing-commits)
  * [Telling git about your signing key](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/telling-git-about-your-signing-key)
  * [Associating an email with your GPG key](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/associating-an-email-with-your-gpg-key)
  * [Setting your commit email address](https://docs.github.com/en/github/setting-up-and-managing-your-github-user-account/managing-email-preferences/setting-your-commit-email-address)


Note that only the commit that creates or updates the `integrate` PR is required to be signed.
Commits to the fork's repository itself, or to any third-party dependency repositories, do not need to be signed (although it is always encouraged). 
For this reason, it is the creator of the PR's commit that is considered to be the "author" of the app in terms of validation and accountability.



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


### How does the App Fair compare to other software distribution platforms?

App Fair apps are written in Swift, a modern & safe language, compiled natively for Intel & ARM, and utilize the `SwiftUI` framework to provide a truly native application user interface.
This makes apps installed from the App Fair tend to be fast and efficient, and have the capability to utilize the full range of the platform's native frameworks.

What sets the App Fair apart from other platform-native store-fronts is that there is no application, fees, or recurring subscriptions to create, develop, and update App Fair apps, nor are there any reviews or systematic delays in issuing updates to apps.

## Developer FAQ

### How do I use git and GitHub?

There are a multitude of resources available online for both `git` (the source control management tool), and `GitHub`, the service that hosts both free and commercial git repositories and provides related services.
A good starting point is GitHub's [Hello World](https://guides.github.com/activities/hello-world/) tutorial.
Fluency with git will be important for managing your app's lifecycle.

### Can I develop an App Fair app with a non-`.edu` academic e-mail address?

While anyone is free to fork the App Fair's [base repository](https://github.com/appfair/App.git), the App Fair's enforces that the committer of the `integrate` PR has an associated academic e-mail address.
These addresses are currently restricted to those ending in `.edu` and `.ac.uk`.
More academic institutions will be added to the list on a case-by-case basis.

### How do I fork the `appfair/App` repository?

Once you have set up your free `APP-ORG` organization that will represent the app, you can fork the repository by going to [https://github.com/appfair/App/fork](https://github.com/appfair/App/fork).
See the GitHub documentation: [Fork a repo](https://docs.github.com/en/get-started/quickstart/fork-a-repo).

### Can I customize my app's icon?

The default icon is automatically generated by the `fairtool` as part of the build process.

### Where do I customize my app's name?

The canonical name of your app is defined by the organization name that hosts your `/App/ fork.
This name must conform to the App Fair's naming conventions, as well as GitHub's limitations on organization names: two short and distinct words made up of URL-safe letters and separated by a hyphen.

In addition to the canonical App-Org name, this name must be mirrored in the app's `Info.plist` metadata file.
Specifically, the keys `CFBundleName` and `CFBundleIdentifier` will need to be updated in your fork, like so:

```xml
<dict>
    <key>CFBundleName</key>
    <string>App Org</string>
    <key>CFBundleIdentifier</key>
    <string>app.App-Org</string>
    <key>CFBundleShortVersionString</key>
    <string>0.0.1</string>
    <key>CFBundleVersion</key>
    <string>1</string>
</dict>
```

### How do I re-name my app?

See the GitHub documentation on [re-naming an organization](https://docs.github.com/en/organizations/managing-organization-settings/renaming-an-organization).
Note that you will, at a minimum, need to update your new org's `/App` fork's `Info.plist` to reflect the new name in the app's metadata.

Also note that a re-named organization will, by definition, also have a new bundle identifier, which will mean that the re-named app will not have access to the sandboxed container of the previous app (since as far as the platform is concerned it is an entirely different and new app).

### What if the name I want is already in use by another GitHub organization?

Pick a new name, or else [see GitHub's advice on the topic](https://docs.github.com/en/github/site-policy/github-username-policy#what-if-the-username-i-want-is-already-taken).

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
This will serve as the description of the 

### How do I provide documentation for my app?

The `README.md` file in your `/App/` fork repository should be used as the entry point to your application's documentation.

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

The GPG signature of the initiator of the `integrate-release` pull request must be for an `.edu` or `.ac.uk` e-mail address and the commit must be [verified](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/about-commit-signature-verification).

You must have a valid e-mail address configured in your list of keys in your [GPG keys settings](https://github.com/settings/keys)


### Can I distribute my app using other distribution channels?

You have complete control over how you distribute your App Fair apps.
Your app's binary package can be hosted as a direct download on your web site, which side-steps the need for users to install the **App Fair.app** catalog browser application in order to use your app.
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
Each app that is listed in that app's GitHub repository, which is required to have issues and discussions enabled.
You can use these forums to contact the developer(s) of the app.
Organizations that are removed from GitHub will have the effect of removing that organization's app from being visible or installable from the **App Fair.app** catalog.

### What platforms do App Fair apps support?

The integration phase of the App Fair builds and packages all apps for both macOS and iOS, but the **App Fair.app** catalog browser is currently only available for macOS 12 on ARM & Intel processors.

### Can the `.ipa` release artifacts be side-loaded on iOS devices?

Side-loading the `.ipa` build artifacts is not well tested at this time.

### Why do apps need to target both macOS and iOS?

The integration phase of the App Fair process will build your app's fork for both macOS and iOS, even though they are currently only installable using the macOS **App Fair.app** catalog browser application.
All apps must run in both iOS and macOS.

### What are the target OS versions for App Fair applications?

In order to be able to utilize the Swift 5.5 concurrency features (async/await & actors), App Fair apps target macOS 12 and iOS 15.
Note that the [Fair/FairCore](https://github.com/appfair/Fair/tree/main/Sources/FairCore) target is compatible with Swift 5.4 in order to use macOS 11 as the build host.

### Can I build a watchOS or tvOS app?

No. Only macOS and iOS builds are currently supported. 

### Can I use App Fair release artifacts with other distribution channels?

The binaries created by the `integrate-release` phase are standard `.zip` and `.ipa` archives and should be suitable for distributing via any compatible app distribution mechanisms.
The release artifacts at [appfair/App releases](https://github.com/appfair/App/releases) are not restricted in how they are distributed or used.

### Which native frameworks will my app be able to use?

As a native compiled Swift application, App Fair apps can link to any native system framework on their target host.
However, certain frameworks that integrate with online components (typically those that utilize cloud services) will not function at runtime when they are used from apps that are distributed without a paid developer subscription.
For example, online geo-location services (used by the MapKit framework) and speech recognition services (used by the Natural Language framework) are unavailable to apps that are distributed through free channels.

In general, frameworks that only utilize local system resources can be used without issue in App Fair apps.
Note that any frameworks your app depends on must be available on *both* `macOS` and `iOS`, or else conditional build guards must be put in place on your code.

### What kinds of source files can I include with my app?

The App Fair's `integrate-release` process uses the [Swift Package Manager (SPM)](https://swift.org/package-manager/) tool for building both your `/APP-ORG/App` fork, as well as all the third-party dependencies.
SPM is focused primarily on the Swift language, but it can be used to build a wide variety of source.
Note that binary dependencies are not permitted in the `Package.swift` build file; the App Fair requires that all source code that goes into the app be available during the build process.

### Do I need to use the Fair library?

Yes.
The App Fair expects that your app will conform to the protocols defined in the `FairApp` library.
The App Fair's `integrate-release` process will validate your `Package.swift` file to ensure that the first dependency for your app is `appfair/Fair` and that it uses the `main` branch.

### Can I load executable code at runtime?

Except for Just-in-Time compilation, the `Sandbox.entitlements` forbids the dynamic loading of unsigned executable code at runtime.
This is to help ensure the App Fair's Source Transparency goal.

### How large are App Fair apps?

Since they use the built-in native frameworks included with the host OS, App Fair apps are generally smaller than those built with cross-platform technologies that need to embed large components. An App Fair app's download size can be under 1 megabyte. There is a 100 megabyte limit to the size of app that will be deployed in the `integrate-release` phases.

### Do App Fair apps auto-update?

No.
There is no auto-updating feature in the App Fair.
App updates must be installed manually and individually from the **App Fair.app** catalog browser application.
Any changes in entitlements or other security features will require explicit consent from the user before an upgrade will take place.

### Can I have multiple versions of an app released simultaneously?

No.
There is only ever a single active version of your app that is available through the [appfair/App releases](https://github.com/appfair/App/releases) (and, thus, available for installation in the **App Fair.app** catalog). 
Users can revert to previous versions only if they have their own backup or if the older version still reside's in the user's Trash after the upgrade.

### What permissions am I permitted to use in `Sandbox.entitlements`

Your app may request any permission in the `Sandbox.entitlements` with the exception of the following permissions:

 - `*.files.all`
 - `*.cs.allow-unsigned-executable-memory`
 - `*.cs.allow-dyld-environment-variables`
 - `*.cs.disable-library-validation`
 - `*.cs.disable-executable-page-protection`

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

### What does the `Fair` library do at runtime?

The `Fair` library, which is required to be the initial dependency of any app distributed via a fair-ground, handles the launch process of the app.
This process adds various Help menus to the app linking to communications forums (such as GitHub Discussions & Issues) by which users can communicate questions and concerns to the developer(s) of the app.
The `Fair` library also can initiate runtime security checks to ensure that apps are behaving correctly.

### Can I link to a specific version of the `Fair.git` dependency?

No.
You can only specify the HEAD branch (`main`) as the `Fair.git` dependency.
This is the ensure that distributed apps are always up-to-date with respect to security validation features and enhancements to the app's runtime environment.

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

Although App Fair apps are signed, sandboxed, and utilize the hardened runtime, they are not automatically notarized during the fair-ground's `integrate-release` phases. 
Notarization requires a recurring paid developer subscription (and the ongoing acceptance of terms & conditions) and is therefore incompatible with the free & fair nature of the App Fair.

If you have a paid developer subscription, you are free to notarize the App Fair release binaries for your app yourself, which will enable you to distribute the same binary both via **App Fair.app** catalog browser application and via other distribution channels.

### How do I re-name my project?

An App Fair app is defined exclusively by the `App-Org` name of the organization.
If you can change the name of your organization, the new app name will be used the next time you make a release.
If you re-name `App-OrgA` to `App-OrgB`, the old `App-OrgA` will automatically disappear from the catalog.
Note, however, that since the bundle identifier will change from `app.App-OrgA` to `app.App-OrgB`, all the container settings for you app will change, so your users will find that they will not be able to access preferences or resources that were stored in the previous `app.App-OrgA` container.

### What files can my app access?

As a sandboxed app, only a certain set of system files can be accessed without adding the `files.user-selected.read-write` permission to the `Sandbox.entitlements` file and the corresponding 


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
You can also manually update your open integration PR via the web interface in order to trigger the fair-ground's [pull_request_target](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#pull_request_target) action.

### What prevents malicious apps from being distributed through the App Fair?

App Fair apps are sandboxed, which prevents them from accessing files that are not explicitly granted authorization from the user.
This helps to contain any damage that may be caused by a malicious (or merely poorly-written) application.

Along with this preventative protection, the system also provides multiple independent remedial protections agains bad actors:

macOS includes built-in antivirus technology called "XProtect" for the signature-based detection of malware, which is updated regularly with signatures of new malware infections and strains.

Furthermore, macOS also includes the "Malware Removal Tool" (MRT), which is a process that remediates infections based on automatic updates of system data files and security information. 
MRT removes malware upon receiving updated information, and it continues to check for infections on restart and login.

### Does the integrate phase run an App's test cases?

The `integrate-release` phases of the fair-ground are run in the trusted environment of the base repository by way of a [pull_request_target](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#pull_request_target) GitHub action.
These phases only run a minimal amount of code that is defined by the App fork: the code that is defined in the `Package.swift` file, which is run in the [restrictive sandboxed environment of the Swift Package Manager](https://swift.org/blog/swift-4-0-released/#package-manager-updates).
Since arbitrary code execution could threaten the secure environment of the base repository, and because the fair-ground's build process needs to be able to create and release apps quickly, it does not run any test code for the apps it builds.

Note, though, that your own repository's fork will come with the `.github/workflows/validate_app.yml` workflow file, which *does* run your unit tests in your own forked repository, provided that you explicitly enable actions for the repository.

### How can I report security issues with the App Fair?

There is a reference implementation of an app that behaves as a bad actor at [https://github.com/Badware-Malware/App.git](https://github.com/Badware-Malware/App.git).
The "Badware Malware" app's repository, and the associated issues and discussion forums, is meant to act as a forum for discussions and issues specific to the App Fair implementation and policies.

For security issues related to the underlying platform or operating system (e.g., bugs in the OS that permit apps to break out of their sandbox), refer to the platform vendor's published security disclosure advice for guidance.

For non-public disclosure and questions related to the App Fair platform itself, you can e-mail [security+nodisclosure@appfair.net](security+nodisclosure@appfair.net).

Sensitive communications should be signed with your PGP public key.
Encryption with the following key is also encouraged:

```
-----BEGIN PGP PUBLIC KEY BLOCK-----
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
=BsIR
-----END PGP PUBLIC KEY BLOCK-----
```

### What is the License for the App Fair project?

Both the [appfair/Fair](https://github.com/appfair/Fair) and [appfair/App](https://github.com/appfair/App) projects, as well as all forks thereof (including the [**App Fair.app** catalog browser application](https://github.com/App-Fair/)), are licensed under the [GNU Affero General Public License](https://www.gnu.org/licenses/agpl-3.0.html).

### Is my app code required to use the AGPL?

Only the portion of your app contained in your app organization's `/APP-ORG/App` fork is required to be covered by the AGPL.
You can develop any portion of your app in a separate repository, which can be covered by any license of your choosing (provided the source code is available during the fair-ground's `integrate-release` phases).



## fair-ground FAQ

### Can I make my own fair-ground?

The "App Fair" is the reference implementation of a fair-ground, using a model of non-commercial open-source projects for academic developers and mandating source transparency and the explicit disclosure of security entitlements.
Alternative fair-ground models are possible by simply mirroring the structure and repositories of the `appfair` organization.
Many of the App Fair's policies are simply flags that can be set on the `fairtool validate` action that is run during the `integrate` phase.
The bulk of the fair-ground's logic, as well as the runtime code for fair-ground integration, is in the [Fair](https://github.com/appfair/Fair) library, which you can customize to handle your own implementation's policies, restrictions, and commerce needs.

## How is the fair-ground's catalog updated?

The "App Fair" reference implementation has a special [catalog release tag](https://github.com/appfair/App/releases/tag/catalog).
This tag is updated with a new `catalog.json` file after every successful `integrate-release` run.
The `catalog.json` file is the manifest of all the current and valid apps that can be downloaded using a catalog browser.
This manifest is generated by the `fairtool`, which uses the GitHub API calls to aggregate the publicly-available information from the release artifacts, fork integrations, and contributor profiles that makes up the distributed collection of available apps.

## Can I run a fair-ground on a self-hosted GitHub runner?

In theory, yes.

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

## Glossary

  * `fair-ground`: A fair-ground is a platform for app distribution. It is the abstract name for the hosted service(s) that provides the resources for the `Fork-Apply-Integrate-Release` process of app ingestion and distribution.
  * FAIR: The `Fork-Apply-Integrate-Release` process summarizes a system whereby developers create apps by fork-ing a fair-ground's base repository and apply-ing their changes to back to the base in the form of a pull request. This is followed by an `integrate` phase that ingests, validates and builds the app, verifies the creator's organization standing, and then initiates a `release` phase that publishes the build artifacts to an app cataloging and distribution system.
  * `Fair.git`: An SPM package hosted at [https://github.com/appfair/Fair.git](https://github.com/appfair/Fair.git) and licensed under the AGPL 3.0 that has targets for both the `Fair` runtime library, as well as the `fairtool` CLI utility.
  * Fair.swift: A Swift 5.5 library that acts as the entry point to all apps that are distributed via a fair-ground; the library provides a container environment with features such as automatic addition of Help & Support menus, as well as runtime validation of security features. All apps distributed via a fair-ground are required to have the HEAD of `Fair.git` as their initial SPM dependency.
  * fairtool: An executable tool that is included with the `Fair.git` package, and is thereby included with all apps that link to the `Fair (runtime)`. The `fairtool` utility is used to validate and merge `integrate-release` requests by the trusted fair-ground build process. The tool can also be used to initialize a new fair-ground with template code for a new base repository. The utility can be run with: the command: `swift run fairtool`
  * App Fair: The App Fair is the name of a fair-ground hosted at [https://www.appfair.net](https://www.appfair.net) that uses GitHub as its host for the `fork-apply` phases, and uses GitHub Actions for the `integrate-release` process and catalog hosting. The App Fair enforces policies of complete source transparency, security entitlement disclosure, and unfettered academic usage.
 
## App Fair Distribution Checklist

Use this checklist to ensure that your app is set up properly for distribution in the App Fair catalog.

### App Organization

 1. Does your `App-Org` name consist of two distinct words separated by a hyphen?
 2. Does your `App-Org` consist solely of URL-safe (ASCII) letters?


### User Account

 1. Do you have a valid (e.g., `.edu` or `.ac.uk`) e-mail address set and verified in your [email settings](https://github.com/settings/emails)?
 1. Is "Keep my email addresses private" turned off in your [email settings](https://github.com/settings/emails)?
 1. Have you enabled [vigilant mode](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/displaying-verification-statuses-for-all-of-your-commits#enabling-vigilant-mode)?
 
### Forked `/App` Repository

 1. Is your forked repository *publicly* accessible at: `https://github.com/App-Org/App/`?
 1. Is your `/App` fork public?
 1. Is your `/App` fork not disabled?
 1. Is your `/App` fork not archived?
 1. Does your `/App` fork have issues enabled?
 1. Does your `/App` fork have discussions enabled?
 1. Does your `/App` fork use the AGPL-3.0 license?

### Source Code

 1. Is the project name in `Package.swift` the same as the `App-Org`?
 1. Is the `Fair` library the first entry in your app's dependencies list?
 1. Is the `Sources/App/AppMain.swift` file unmodified from the origin?

### Metadata

 1. Does your app have a version?
 1. Does your app have an icon?
 1. Does your `Info.plist` have `*UsageDescription` properties for each entitlement sought in `Sandbox.entitlements`?
 
### Pull Request

 1. Is the title of your Pull Request formatted as: `App-Org v1.2.3`?
 1. Does the title of your PR match the version in `Info.plist`
 1. Is your Pull Request commit signed and marked as "verified" by GitHub?
 1. Is the e-mail address associated with the commit valid (e.g., an `.edu` or `.ac.uk` address)?
 
 
## App Fair News

For announcements about the App Fair, please subscribe to the Telegram Channel at [https://t.me/appfair](https://t.me/appfair).
 
## App Fair Badge

You can use the following badge freely on your app's promotional material to link directly to your App Fair catalog entry.
It is advised that you link directly to the version of the badge hosted at [https://www.appfair.net/appfair-free-for-all.svg](https://www.appfair.net/appfair-free-for-all.svg), since that is that resource that will be updated to use the most current version of the graphic and animation.
You can include the App Fair badge with the following HTML:

```
<img src="https://www.appfair.net/appfair-free-for-all.svg" width="450" alt="Free for all at the App Fair – https://www.appfair.net" />
```

<p align="center"><img src="https://www.appfair.net/appfair-free-for-all.svg" width="450" alt="Free for all at the App Fair – https://www.appfair.net" /></p>
