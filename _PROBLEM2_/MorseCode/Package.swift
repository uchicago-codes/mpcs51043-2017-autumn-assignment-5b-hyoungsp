// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MorseCode",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/uchicago-codes/mpcs51043-2017-autumn-assignment-5b-hyoungsp.git", from: "2.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "MorseCode",
            dependencies: ["MorseCoder"]),
    ]
)