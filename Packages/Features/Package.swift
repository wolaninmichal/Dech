// swift-tools-version: 6.4

import PackageDescription

/// Dependencies shared by every feature target.
let core: [Target.Dependency] = [
    .product(name: "Domain", package: "Domain"),
    .product(name: "DesignSystem", package: "DesignSystem"),
]

/// Dependencies shared by every test target.
let testing: [Target.Dependency] = [
    .product(name: "Domain", package: "Domain"),
    .product(name: "DomainTesting", package: "Domain"),
]

let package = Package(
    name: "Features",
    platforms: [.iOS(.v17)],
    products: [
        // only Root is public, the app can't import individual features directly
        .library(name: "Root", targets: ["Root"]),
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../DesignSystem"),
    ],
    targets: [
        // Features
        .target(name: "Onboarding", dependencies: core),
        .target(name: "Home", dependencies: core),
        .target(name: "Plan", dependencies: core),
        .target(name: "Settings", dependencies: core),
        .target(
            name: "Root",
            dependencies: core + ["Onboarding", "Home", "Plan", "Settings"]
        ),

        // Tests
        .testTarget(name: "OnboardingTests", dependencies: ["Onboarding"] + testing),
        .testTarget(name: "HomeTests", dependencies: ["Home"] + testing),
        .testTarget(name: "PlanTests", dependencies: ["Plan"] + testing),
        .testTarget(name: "SettingsTests", dependencies: ["Settings"] + testing),
        .testTarget(name: "RootTests", dependencies: ["Root", "Onboarding"] + testing),
    ]
)
