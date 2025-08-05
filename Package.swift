// swift-tools-version:5.10.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let dateFormattedLocalized: Self = "DateFormattedLocalized"
    static let language: Self = "Language"
    static let translatingDependencies: Self = "Translating+Dependencies"
    static let singlePlural: Self = "SinglePlural"
    static let translated: Self = "Translated"
    static let translatedString: Self = "TranslatedString"
    static let translating: Self = "Translating"
    static let translations: Self = "Translations"
    static let translatingTestSupport: Self = "TranslatingTestSupport"
}

extension Target.Dependency {
    static var dateFormattedLocalized: Self { .target(name: .dateFormattedLocalized) }
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
    static var dependencies: Self { .product(name: "Dependencies", package: "swift-dependencies") }
    static var dependenciesTestSupport: Self { .product(name: "DependenciesTestSupport", package: "swift-dependencies") }
}

let package = Package(
    name: "swift-translating",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .macCatalyst(.v16),
        .tvOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        .library(
            name: .translating,
            targets: [.translating]
        ),
        .library(name: .language, targets: [.language]),
        .library(name: .translatingDependencies, targets: [.translatingDependencies]),
        .library(name: .singlePlural, targets: [.singlePlural]),
        .library(name: .translated, targets: [.translated]),
        .library(name: .translatedString, targets: [.translatedString]),
        .library(name: .dateFormattedLocalized, targets: [.dateFormattedLocalized]),
        .library(name: .translatingTestSupport, targets: [.translatingTestSupport]),
        .library(name: .translations, targets: [.translations])
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.9.2")
    ],
    targets: [
        .target(
            name: .translating,
            dependencies: [
                .language,
                .translatingDependencies,
                .singlePlural,
                .translated,
                .translatedString,
                .dateFormattedLocalized
            ]
        ),
        .testTarget(
            name: .translating.tests,
            dependencies: [
                .translating,
                .dependenciesTestSupport
            ]
        ),
        .target(name: .language),
        .testTarget(
            name: .language.tests,
            dependencies: [
                .language,
                .dependenciesTestSupport
            ]
        ),
        .target(
            name: .translatingDependencies,
            dependencies: [
                .language,
                .translated,
                .translatedString,
                .dependencies
            ]
        ),
        .testTarget(
            name: .translatingDependencies.tests,
            dependencies: [
                .translatingDependencies,
                .dependenciesTestSupport
            ]
        ),
        .target(
            name: .singlePlural,
            dependencies: [
                .language,
                .translated,
                .translatedString
            ]
        ),
        .testTarget(
            name: .singlePlural.tests,
            dependencies: [
                .singlePlural,
                .dependenciesTestSupport
            ]
        ),
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
                .dependenciesTestSupport
            ]
        ),
        .target(
            name: .translatedString,
            dependencies: [
                .translated
            ]
        ),
        .testTarget(
            name: .translatedString.tests,
            dependencies: [
                .translatedString,
                .dependenciesTestSupport
            ]
        ),
        .target(
            name: .dateFormattedLocalized,
            dependencies: [
                .dependencies,
                .language,
                .translatingDependencies
            ]
        ),
        .testTarget(
            name: .dateFormattedLocalized.tests,
            dependencies: [
                .dateFormattedLocalized,
                .dependenciesTestSupport,
                .language
            ]
        ),
        .target(name: .translatingTestSupport),
        .target(
            name: .translations,
            dependencies: [
                .translating
            ]
        )
    ]
)

extension String {
    var tests: Self { "\(self) Tests" }
}
