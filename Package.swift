// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tic Tac Swift",
    dependencies: [
        .package(url: "https://github.com/rhx/SwiftGtk.git", .branch("main")),
    ],
    targets: [
        .target(
            name: "TicTacSwift",
            dependencies: ["Gtk"]),
       .testTarget(
            name: "TicTacSwiftTests",
            dependencies: ["Tic Tac Swift"]),
    ]
)
