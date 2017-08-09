// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "TattyHub",
    targets: [
        Target(name: "Core"),
        Target(name: "Server"),
        Target(name: "Client")
        ],
    dependencies: [
        .Package(url: "https://github.com/vapor/sockets.git",                 majorVersion: 2)
    ]
)
