// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "Notifications",
    platforms: [
        .iOS(.v17),
        .macOS(.v14), // to remove if this package imports UIKit (e.g. UIApplication)
    ],
    products: [
        .library(name: "Notifications", targets: ["Notifications"]),
    ],
    dependencies: [
        .package(path: "../Domain"),
    ],
    targets: [
        .target(
            name: "Notifications",
            dependencies: [
                .product(name: "Domain", package: "Domain"),
            ]
        ),
        .testTarget(
            name: "NotificationsTests",
            dependencies: [
                "Notifications",
                .product(name: "Domain", package: "Domain"),
                .product(name: "DomainTesting", package: "Domain"),
            ]
        ),
    ]
)
