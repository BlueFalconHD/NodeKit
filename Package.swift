// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NodeKit",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NodeKit",
            targets: ["NodeKit"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NodeKit", swiftSettings: [
                .swiftLanguageMode(.v6)
            ]),
        .testTarget(
            name: "NodeKitTests",
            dependencies: ["NodeKit"]),
    ]
)
