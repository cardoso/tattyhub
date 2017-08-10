// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "TattyHub",
    targets: [
        Target(name: "TattyCore"),
        Target(name: "TattyServer", dependencies: ["TattyCore"]),
        Target(name: "TattyClient", dependencies: ["TattyCore"])
        ],
    dependencies: [
        .Package(url: "https://github.com/vapor/sockets.git",                 majorVersion: 2)
    ]
)
