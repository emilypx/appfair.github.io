---
name: AppFair
title: The App Fair
---

# Welcome to the App Fair

The App Fair is an independent app distribution platform for free and open-source macOS applications.

# The App Fair For Users

From an end-user standpoint, the **App Fair.app** catalog browser application allows you to research, discover, install, and update applications from a potentially large catalog of free applications. 

Apps installed with the **App Fair.app** application are created using the modern platform-native SwiftUI framework and built for both Intel and ARM processors, and thus tend to run faster and use resources more efficiently than other cross-platform application frameworks.


# The App Fair For Developers

App Fair apps are written in Swift and utilize a native SwiftUI user interface. 
Apps use Swift 5.5, thereby unlocking the full power of Swift's async/await concurrency features and its actor model.

The distribution process for App Fair apps is completely automated, instantaneous, and free. 
Provided you have a free GitHub account, no additional registration, sign-up, or approval is required in order to start developing and distributing apps for the App Fair.


## Introduction: Fair Ground and the "Fair" process?

"Fork-App-Integrate-Release" (F-A-I-R) describes the stages of creating, developing, building, and distributing an App Fair app.
The "Fork" and "App" parts are handled by you, the developer: a fork is created of the template `/App` repository, and you develop your app in your own's organization's repository.
The "Integrate" and "Release" are handled by the build host that accepts pull requests from the developer's fork and validates, builds, packages, and releases the installable app.
The build host is considered the "Fair Ground" for the App Fair, and the default build host is implemented using a series of GitHub actions, artifacts, and releases.

From an App developer standpoint, an App Fair app is a Swift application that is defined by a Swift Package Manager `Package.swift` file, and that uses of two source code repositories: *Fair* & *App*:
 - [https://github.com/appfair/App](https://github.com/appfair/App) is the repository that is forked to create a new  App Fair app; PRs submitted to this repository are automatically built and released to the **App Fair.app** catalog.
 - Fair is the runtime SwiftUI library that is included in every App Fair project, and acts as a sandboxed container within which your application is run. The `Fair` library is the only required dependency for your app's [https://github.com/appfair/App](https://github.com/appfair/App) fork.

## How does an "App Fair" app differ from apps using other distribution platforms?

App Fair apps are written in Swift, a modern & safe language, compiled natively for Intel & ARM, and utilize the SwiftUI framework to provide a truly native application user interface.
This makes apps installed from the App Fair tend to be fast and efficient, and have the capability to utilize the full range of the platform's native frameworks.

Unlike other platform-native storefronts, there is no required developer application, fees, or recurring subscriptions, nor is there any review process or delays in issuing updates.

The App Fair's "Source Transparency" feature means that there is always visibility into exactly what code is running on your device.

## The Structure of the App Fair project

Upon submitting a [Pull Request](https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests) for your `/App` fork's changes, your project will be automatically built, signed, packaged and distributed as a native macOS application via the [appfair/App releases](https://github.com/appfair/App/releases). 

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

Once your organization is set up, you create your app's project by forking the [https://github.com/appfair/App](https://github.com/appfair/App) repository. 
This is a Swift project that contains the shell of a cross-platform SwiftUI app that you will use as your starting point.

Your app will exist in a top-level repository named "App"; it must continue to be called "App", since that is how the catalog browser will be able to access your project metadata.

### Developing your `/App` fork

The `/App` fork is structured as a standard swift package, and includes the following code that will be used as the scaffold of the app:

  * App.xcworkspace
  * App.xcodeproj
  * App.entitlements
  * App.plist
  * App.xcassets
  * Package.swift
  * Sources/App/App.swift
  * Tests/AppTests/AppTests.swift

App development can be done by opening `App.xcworkspace` using `Xcode.app` to build, run, and debug the SwiftUI app that is defined in `Sources/App/App.swift`.
Note, though, that changes to these project files, `App.xcworkspace` and `App.xcodeproj`, will *not* be incorporated into the final project.
It will be best not to make changes to the project files themselves, since none of the changes will be used in the eventual `Integrate-Release` phases of the process.

### Managing dependencies in your `/App` fork

The `Package.swift` file that defines how your package is built.
Only the dependencies section of this file can be edited to add your swift package dependencies.
The section of the `Package.swift` file that can be altered is marked with the comment:

```swift
// Everything above this line must remain unmodified.
```

This restriction is enforced by the `Integration` phase of the process, which will refuse to build the project if the fenced areas have been modified.

### Editing the `Sources/App/App.swift` 

The `App.swift` file is the entry point to your application.
It has a defined structure whose front-matter cannot be changed, as fenced by the comment:

```swift
// Everything above this line must remain unmodified.
```

This structure is used to correctly integrate with the `FairApp` library, such as creating the proper help menus and ensuring that the app has a settings interface.


## The "Fair App Integration Release" process

Once your app is ready to be released, you create a Pull Request (PR) from your Fork to the upstream [https://github.com/appfair/App](https://github.com/appfair/App) repository. 
This PR will not be merged; rather, it acts as a trigger to initiate the `Integration` and `Releases` phases of the App Fair process.
Once a release is created, it will be available at the list of releases at [https://github.com/appfair/App/releases](https://github.com/appfair/App/releases), from which it can be downloaded using the **App Fair.app** catalog browser or other compatible application.

### The Fair App Integration Phase

When a pull request is submitted from your app's fork back to the origin repository at [https://github.com/appfair/App](https://github.com/appfair/App), the integration phase of the App Fair's `Fork-Apply-Integrate-Release` process is initiated.
The PR will triggered a GitHub action ([pull_request_target](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#pull_request_target)) running on a macOS build host.
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
  * `App.entitlements`: the list of permissions the app will request, such as network or file system access
  * `App-Name-source.tgz`: the complete source code of the integration PR as well as all the resolved SPM dependencies that were used to create the release
  * `App-Name.png`: the app's icon
  * `Package.resolved`: the release versions of all the resolved SPM dependenciens

(Note that in addition to these artifacts, GitHub also automatically includes a "Source code (zip)" and "Source code (tar.gz)" archive in the releases; these are 'shallow' source archives without the dependent code; for access to the complete archive of source code that was used to actually build an application, the generated `App-Name-source.tgz` release artifact should be used).


## App Fair Catalog Requirements 

The "App Fair" catalog is the list of valid app releases at [appfair/App releases](https://github.com/appfair/App/releases) cross-referenced with the metadata for the `App/` forks: issues, discussions, support info, wikis, project web site, etc.
This metadata is accumulated using the public GitHub APIs, and the appearance in the catalog is completely automated.

### Org Requirements

In order for an organization's `/App` project to be visible in the **App Fair.app** catalog, it must be a public organization with at least one public member. 
The organization must have a repository (or redirection) named "App" (literally), which must be a fork of the [appfair/App](https://github.com/appfair/App) template repository.
An addition, the repository must have issues & discussions enabled, and also must be public as well as not archived.

### Licensing

The [appfair/App](https://github.com/appfair/App) repository is licensed under the GNU AGPL, which means that all forks of the project are also covered under that license. 
If you would like your app's code to be licensed differently, you can create a separate repository (either in the same organization or elsewhere; it merely needs to be publicly available on GitHub) with another license of your choosing, and then reference the project(s) from your `Package.swift` dependencies section. 
The App/Fair release process doesn't perform any validation of the licenses of any Swift dependencies; it only requires that the license for the forked `/App` project itself remain unchanged, and that all the source files that act as inputs to the build process are available for inspection and analysis at the time of building.


## App Fair Security

A challenge for any application distribution platform is dealing with "badware", which can be simply defined as software with undesired effects. 
These can be merely annoying and wasteful, such as adware, containers for offensive content, covert proof-of-work crypto-currency miners, and other potentially unwanted programs ("PUPs"). 
Software can also be actively hostile, such as programs that attempt to exfiltrate your personal data and activities ("spyware") or programs that attempt to lock you out of your own data ("ransomware"). 
At the extreme end of the spectrum, programs that run on your computer can be actively dangerous to both yourself as well as the broader network: they can act as hosts for virus propagation or externally-coordinated clients for a "botnet" that can perform distributed denial of service (DDoS) attacks or other malicious activities.

Web browsers have been dealing with these risks and issues ever since the advent of JavaScript. 
Browsers have evolved to enable arbitrary code to be run while still protecting the user's system and privacy (to some extent) by having the untrusted code run inside a sandbox that restricts the sorts of activities that are permitted: file system access is generally restricted to cookie storage and compartmentalized local file storage APIs, and network access is typically limited to HTTP (and websockets) access back to the network host for the page that loaded the code.

Similarly, applications that run on most modern operating systems can be "hardened" and constrained to a "sandbox", which restricts the application in what it can see and do.
File system access, including access to your personal data (such as contacts, mail, and photos), require explicit consent from the user before the app can access the data.
Similarly, direct access to the local hardware (microphone, video/camera, keyboard) is constrained and also requires explicit consent.
The App Fair integration process requires that all software be hardened and sandboxed in order to appear in the catalog.

The App Fair Integration-Release process is completely automated; there is no individual review of apps, neither when they are initially submitted nor when updates are released.
This allows the release & update processes to be free of delays and keeps the catalog free from reviewer bias, but it also removes any possibility of pre-distribution "gate-keeping" to protect the community from unwanted programs.
The App Fair instead provides post-distribution gate-keeping by requiring that the source code for the entire app be available to the build process and that it be hosted in publicly-available GitHub repositories.
For any release in the App Fair catalog, the complete source code is available for inspection, review, and analysis by the entire world.
This access enables the security community to use all its resources to identify, isolate, and mitigate badly-behaved apps.
In addition, a requirement that all the code be hosted in publicly-available Git repositories means that tools like [GitHub's code scanning](https://docs.github.com/en/code-security/secure-coding/automatically-scanning-your-code-for-vulnerabilities-and-errors/about-code-scanning) can be used to identify security vulnerabilities in the app or any of the frameworks it embeds.

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

### What versioning scheme do App Fair apps use?

App Fair apps do not use any sort of conventional version numbering scheme. Rather than a dotted-numeric identifier (such as `1.2.3`), App Fair apps are automatically versioned with a hash of the commit for the pull request that triggered the build of the app. What this means is that you can always take the version number (which you can copy & paste from Finder's `Get Info` on the app) and be able to browse the source code that went into the app's release by searching for that unique commit hash on GitHub.

### Can I have multiple versions of an app released simultaneously?

No: there is only ever a single active version of your app that is available through the [appfair/App releases](https://github.com/appfair/App/releases) (and, thus, available for installation in the **App Fair.app** catalog). 

### Can I customize my app's icon?

The default icon is automatically generated by the `fairtool` as part of the build process.

### What is the `fairtool`?

Fairtool is the name of the utility that is included with the `Fair` project, that can be used to validate a project, generate icons, and the like.
It can be run from any `/App` fork from Terminal.app with the command:

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
The App Fair is open to al apps: Student Projects, Vanity App, Demos, Experiments, Tests, and Re-mixes of other App Fair apps.
As a completely automated system, there is no human review, so the only requirement to be included in the App Fair catalog is that it passes the automated validation phases of the `integrate-release` process.

### How can I monetize my app?

Apps available through the **App Fair.app** catalog browser application are always free.
Activating GitHub sponsorships will enable your account to accept financial contributions to your project through any of the supported funding model platforms.
When sponsorships are enabled, your app's container will automatically add a Help menu link to the sponsorship service.

### How can I remove my app from the App Fair catalog?

The simplest way to remove your app from showing up in the **App Fair.app** catalog is to mark your repository or organization as "private", or else archive (or delete) your organization's `/App` fork.

In addition, disabling issues or discussions for your organization's `/App` fork will also have the result of making your app no longer appear as a valid installation candidate in the **App Fair.app** catalog.

### How can I have someone else's app removed from the App Fair?

As the App Fair's `integrate-release` process is completely automated, there is no mechanism for direct management of, or intervention in, the app release process. 
Organizations that are removed from GitHub will have the effect of removing that organization's app from being visible or installable from the **App Fair.app** catalog.

### Can App Fair apps be installed on non-macOS platforms?

The integration phase of the App Fair builds and packages all apps for both macOS and iOS, but the **App Fair.app** catalog browser is currently only available for macOS 12 on ARM & Intel processors.

### Why do apps need to build for both macOS and iOS?

The integration phase of the App Fair process will build your app's fork for both macOS and iOS, even though they are currently only installable using the macOS **App Fair.app** catalog browser application. 
This is in order to be able to run your app's unit tests in a sandboxed environment, as well as automatically generating screenshots for users to preview in a catalog browser.

### What is the target OS for App Fair applications

In order to be able to utilize the Swift 5.5 concurrency features (async/await & actors), App Fair apps target macOS 12 and iOS 15.
Note that the [Fair/FairCore](https://github.com/appfair/Fair/tree/main/Sources/FairCore) target is compatible with Swift 5.4 in order to use macOS 11 as the build host.

### Can I build a watchOS or tvOS app?

No. Only macOS and iOS builds are currently supported. 

### Can I use the release artifacts with other distribution channels

The binaries created by the `Integrate-Release` phase are standard `.zip` and `.ipa` archives and should be suitable for distributing via any compatible app distribution mechanisms.
The release artifacts at [appfair/App releases](https://github.com/appfair/App/releases) are not constrained in how they are distributed or used.

### Which native frameworks will my app be able to use?

As a native compiled Swift application, App Fair apps can link to any native system framework on their target host.
However, certain frameworks that integrate with online components (typically those that utilize cloud services) will not function at runtime when they are used from apps that are distributed without a paid developer subscription.
For example, online geo-location services (used by the MapKit framework) and speech recognition services (used by the Natural Language framework) are unavailable to apps that are distributed through free channels.

In general, frameworks that only utilize local system resources can be used without issue in App Fair apps.

### How large are App Fair apps?

Since they use the built-in native frameworks included with the host OS, App Fair apps are generally smaller than those built with cross-platform technologies that need to embed large components. An App Fair app's download size can be under 1 megabyte. There is a 100 megabyte limit to the size of app that will be deployed in the `Integrate-Release` phase.

### Can I distribute an Electron-style JavaScript app?

The shell of the App you write, including any top-level system menus, must utilize SwiftUI views, idioms, and commands.
Embedding a binary framework, such as the Chromium rendering engine and the Node.js runtime that together power Electron apps, is not supported.
However, there is nothing preventing you from embedding any arbitrary native view controller within your app's view hierarchy, such as the `WKWebView` that enables apps to host an HTML5 application within a Safari-like container.

### Do I need a Mac to develop App Fair apps?

*Technically*, no: you could theoretically use any OS to write the Swift code for your `/App` fork.
Since the Integration and Release phases of the App Fair process are all run in the cloud, no client-side build & run activity is required.

In practice, however, to develop anything but the most trivial of apps requires being able to use a modern IDE, debugger, and the ability to actually run your app in order to test and refine the behavior.

### Are App Fair apps signed?

Yes. 
As of macOS 12, apps must be signed in order to run.
The same requirement exists for iOS.
The `Integrate` phase of the App Fair process signs the app with an "ad-hoc" signing certificate in order to satisfy this requirement.

### Are App Fair apps notarized?

Although App Fair apps are signed, sandboxed, and utilize the hardened runtime, they are not automatically notarized during the `Integration-Release` phases. 
Notarization requires a paid developer subscription (and the ongoing acceptance of terms & conditions) and is therefore incompatible with the free & open nature of the App Fair.

If you have a paid developer subscription, you are free to notarize the App Fair release binaries for your app yourself, which will enable you to distribute the same binary both via **App Fair.app** catalog browser application and via other distribution channels.

### What can I change in the Package.swift file?

The `Package.swift` for your `/App` fork is expected to conform to the structural conventions of App Fair apps.
As such, the outline of the `Package.swift` file cannot be changed, but some of the elements, such as the package dependencies, can be edited.
This restrictions only apply to the `Package.swift` in the `/App` fork itself, and not to the `Package.swift` for any dependent packages.

### My app's code mostly resides in an external Package. How can I make a release when only the dependent package has changed?

The App Fair's `Integrate-Release` phases are triggered by Pull Request that are made from your `/App` fork.
So in order to create a new release, something in your `/App` fork will need to change before a Pull Request can be created.
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

Only the portion of your app contained in your app organization's `/App` fork is required to be covered by the AGPL.
You can develop any portion of your app in a separate repository, which can be covered by any license of your choosing (provided the source code is available for the `Integration-Releases` phases of the process).



