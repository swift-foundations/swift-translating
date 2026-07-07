// swift-tools-version: 6.3.1

import PackageDescription

extension String {
    static let translatingPlatform: Self = "Translating Platform"
    static let language: Self = "Language"
    static let translatingDependencies: Self = "Translating+Dependencies"
    static let singlePlural: Self = "Single Plural"
    static let translated: Self = "Translated"
    static let translatedString: Self = "Translated String"
    static let translating: Self = "Translating"
    static let translations: Self = "Translations"
    static let translatingTestSupport: Self = "Translating Test Support"
    var tests: Self { self + " Tests" }
}

extension Target.Dependency {
    static var translatingPlatform: Self { .target(name: .translatingPlatform) }
    static var language: Self { .target(name: .language) }
    static var translatingDependencies: Self { .target(name: .translatingDependencies) }
    static var singlePlural: Self { .target(name: .singlePlural) }
    static var translated: Self { .target(name: .translated) }
    static var translatedString: Self { .target(name: .translatedString) }
    static var translating: Self { .target(name: .translating) }
    static var translations: Self { .target(name: .translations) }
    static var translatingTestSupport: Self { .target(name: .translatingTestSupport) }
}

extension Target.Dependency {
    static var bcp47: Self { .product(name: "BCP 47", package: "swift-bcp-47") }
    static var dependencies: Self { .product(name: "Dependencies", package: "swift-dependencies") }
    static var dependenciesTestSupport: Self { .product(name: "Dependencies Test Support", package: "swift-dependencies") }
}

let package = Package(
    name: "swift-translating",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(name: .translating, targets: [.translating]),
        .library(name: .language, targets: [.language]),
        .library(name: .translatingDependencies, targets: [.translatingDependencies]),
        .library(name: .singlePlural, targets: [.singlePlural]),
        .library(name: .translated, targets: [.translated]),
        .library(name: .translatedString, targets: [.translatedString]),
        .library(name: .translatingPlatform, targets: [.translatingPlatform]),
        .library(name: .translatingTestSupport, targets: [.translatingTestSupport]),
        .library(name: .translations, targets: [.translations]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-ietf/swift-bcp-47.git", branch: "main"),
        .package(url: "https://github.com/swift-foundations/swift-dependencies.git", branch: "main"),
    ],
    targets: [

        // MARK: - Umbrella

        .target(
            name: .translating,
            dependencies: [
                .language,
                .translatingDependencies,
                .singlePlural,
                .translated,
                .translatedString,
            ]
        ),
        .testTarget(
            name: .translating.tests,
            dependencies: [
                .translating,
                .translatingPlatform,
                .dependenciesTestSupport,
            ]
        ),

        // MARK: - Language

        .target(
            name: .language,
            dependencies: [
                .bcp47,
            ]
        ),
        .testTarget(
            name: .language.tests,
            dependencies: [
                .language,
                .dependenciesTestSupport,
            ]
        ),

        // MARK: - Dependencies

        .target(
            name: .translatingDependencies,
            dependencies: [
                .language,
                .translated,
                .translatedString,
                .dependencies,
            ]
        ),
        .testTarget(
            name: .translatingDependencies.tests,
            dependencies: [
                .translatingDependencies,
                .dependenciesTestSupport,
            ]
        ),

        // MARK: - Single Plural

        .target(
            name: .singlePlural,
            dependencies: [
                .language,
                .translated,
                .translatedString,
            ]
        ),
        .testTarget(
            name: .singlePlural.tests,
            dependencies: [
                .singlePlural,
                .dependenciesTestSupport,
            ]
        ),

        // MARK: - Translated

        .target(
            name: .translated,
            dependencies: [
                .language,
            ]
        ),
        .testTarget(
            name: .translated.tests,
            dependencies: [
                .translated,
                .dependenciesTestSupport,
            ]
        ),

        // MARK: - Translated String

        .target(
            name: .translatedString,
            dependencies: [
                .translated,
            ]
        ),
        .testTarget(
            name: .translatedString.tests,
            dependencies: [
                .translatedString,
                .translatingPlatform,
                .dependenciesTestSupport,
            ]
        ),

        // MARK: - Platform

        .target(
            name: .translatingPlatform,
            dependencies: [
                .dependencies,
                .language,
                .singlePlural,
                .translated,
                .translatedString,
                .translating,
                .translatingDependencies,
            ]
        ),
        .testTarget(
            name: .translatingPlatform.tests,
            dependencies: [
                .translatingPlatform,
                .dependenciesTestSupport,
                .language,
            ]
        ),

        // MARK: - Test Support

        .target(name: .translatingTestSupport),

        // MARK: - Translations

        .target(
            name: .translations,
            dependencies: [
                .translating,
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
