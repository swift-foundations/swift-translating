// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension Target.Dependency {
    static let dependencies:Self = .product(name: "Dependencies", package: "swift-dependencies")
}

let package = Package(
    name: "Languages",
    platforms: [.macOS(.v10_15), .iOS(.v13)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Languages",
            targets: ["Languages"]),
        .library(
            name: "LanguageClient",
            targets: ["LanguageClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Languages",
            dependencies: []),
        .target(
            name: "LanguageClient",
            dependencies: ["Languages", .dependencies]),
        .testTarget(
            name: "LanguageClient.Tests",
            dependencies: [
                "Languages",
                "LanguageClient"
            ]
        )
    ]
)
