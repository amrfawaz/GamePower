// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Packages",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "AppConfigurations",
            targets: ["AppConfigurations"]),
        .library(
            name: "CoreInterface",
            targets: ["CoreInterface"]),
        .library(
            name: "NetworkManager",
            targets: ["NetworkManager"]),
        .library(
            name: "App",
            targets: ["App"]),
        .library(
            name: "Navigation",
            targets: ["Navigation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.9.1"))
    ],
    targets: [
        .target(
            name: "AppConfigurations",
            dependencies: []
        ),
        .target(
            name: "CoreInterface",
            dependencies: []
        ),
        .target(
            name: "NetworkManager",
            dependencies: [
                "Alamofire",
                "AppConfigurations"
            ]
        ),
        .target(
            name: "App",
            dependencies: [
                "NetworkManager" // Add NetworkManager as a dependency here
            ]
        ),
        .target(
            name: "Navigation",
            dependencies: ["App"]
        ),
    ]
)
