// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "Persistence",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(name: "Persistence", targets: ["Persistence"]),
    ],
    dependencies: [
        .package(path: "../Domain"),
    ],
    targets: [
        .target(
            name: "Persistence",
            dependencies: [
                .product(name: "Domain", package: "Domain"),
            ]
        ),
        .testTarget(
            name: "PersistenceTests",
            dependencies: [
                "Persistence",
                .product(name: "Domain", package: "Domain"),
                .product(name: "DomainTesting", package: "Domain"),
            ]
        ),
    ]
)
