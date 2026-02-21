// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NaturalText",
    platforms: [
        .iOS("18.2"),
        .macOS("10.15"),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NaturalText",
            targets: ["NaturalText"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NaturalText"
        ),
        .testTarget(
            name: "NaturalTextTests",
            dependencies: ["NaturalText"]
        ),
    ]
)
