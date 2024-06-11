// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let languages:Self = "Languages"
}

extension Target.Dependency {
    static let dependencies:Self = .product(name: "Dependencies", package: "swift-dependencies")
}

extension Target.Dependency {
    static let languages:Self = .target(name: .languages)
}

let package = Package(
    name: "swift-language",
    platforms: [
        .macOS(
            .v10_15
        ),
        .iOS(
            .v13
        )
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: .languages,
            targets: [
                .languages
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.1.5")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: .languages,
            dependencies: [
                .dependencies
            ]
        ),
        .testTarget(
            name: .languages + "Tests",
            dependencies: [
                .languages
            ]
        )
    ],
    swiftLanguageVersions: [.version("6")]
)

