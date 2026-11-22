// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(name: "Networking", targets: ["Networking"]),
    ],
    dependencies: [
        .package(path: "../Domain"),
    ],
    targets: [
        .target(
            name: "Networking",
            dependencies: [
                .product(name: "Domain", package: "Domain"),
            ]
        ),
        .testTarget(
            name: "NetworkingTests",
            dependencies: [
                "Networking",
                .product(name: "Domain", package: "Domain"),
                .product(name: "DomainTesting", package: "Domain"),
            ]
        ),
    ]
)
