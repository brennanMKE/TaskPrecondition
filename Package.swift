// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TaskPrecondition",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "TaskPrecondition",
            targets: ["TaskPrecondition"]),
    ],
    dependencies: [
        .package(url: "https://github.com/brennanMKE/Hela", from: "0.0.3")
    ],
    targets: [
        .target(
            name: "TaskPrecondition",
            dependencies: []),
        .testTarget(
            name: "TaskPreconditionTests",
            dependencies: ["TaskPrecondition", "Hela"]),
    ]
)
