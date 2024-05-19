# README #
Table of contents:
- [Getting Started](#getting-started)
- [Requirements](#requirements)
- [Architecture](#architecture)
    - [Folders structure](#folders-structure)



## Getting Started
To get GamePower application up and running follow this simple step.
Install applications required in development process.

## Requirements ##

- Xcode 15
- iOS SDK 15+
- Swift 5.8+

## Architecture ##

- App is written using MVVM+C architecture
- SwiftUI is used for creating views
- It uses Combine for view model bindings and logic
- Alamofire is used for API connections
- SPM is used as a dependencies manager
- App is modularized - has one package with most
-  of the sources and is divided into libraries inside this package, see [Modularization part 1](https://www.pointfree.co/episodes/ep171-modularization-part-1) for more info

### Folders structure ##

* Sources:
- SupportingFiles (Info.plist, GoogleService-Info etc.)

* Package/Sources:
- App
    - Inside Sources folder there is folder for each module 
- AppConfigurations
- CoreInterface
- Navigation - I'm provided simple navigation logic using navigation stack.
- Netwoork Manager - Using Alamofire for a robust network layer.
