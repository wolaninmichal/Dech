// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(name: "Domain", targets: ["Domain"]),
        .library(name: "DomainTesting", targets: ["DomainTesting"]),
    ],
    targets: [
        .target(name: "Domain"),
        .target(
            name: "DomainTesting",
            dependencies: ["Domain"]
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: [
                "Domain",
                "DomainTesting",
            ]
        ),
    ]
)
