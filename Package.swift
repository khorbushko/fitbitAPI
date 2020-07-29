// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "fibi2t",
    platforms: [
      .iOS(.v11)
    ],
    products: [
        .library(
            name: "fibi2t",
            targets: ["fibi2t"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "fibi2t",
            dependencies: []),
        .testTarget(
            name: "fibi2tTests",
            dependencies: ["fibi2t"]),
    ]
)
