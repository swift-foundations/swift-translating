// swift-tools-version:5.10.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let translating: Self = "Translating"
    static let language: Self = "Language"
    static let languageDependency: Self = "Language Dependency"
    static let locale: Self = "Locale"
    static let singlePlural: Self = "SinglePlural"
    static let string: Self = "String"
    static let translated: Self = "Translated"
    static let translatedString: Self = "TranslatedString"
    static let dateFormattedLocalized: Self = "Date Formatted Localized"
}

extension Target.Dependency {
    static var translating: Self { .target(name: .translating) }
    static var language: Self { .target(name: .language) }
    static var languageDependency: Self { .target(name: .languageDependency) }
    static var locale: Self { .target(name: .locale) }
    static var singlePlural: Self { .target(name: .singlePlural) }
    static var string: Self { .target(name: .string) }
    static var translated: Self { .target(name: .translated) }
    static var translatedString: Self { .target(name: .translatedString) }
    static var dateFormattedLocalized: Self { .target(name: .dateFormattedLocalized) }
}

extension Target.Dependency {
    static var dependencies: Self { .product(name: "Dependencies", package: "swift-dependencies") }
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
        .library(name: .languageDependency, targets: [.languageDependency]),
        .library(name: .locale, targets: [.locale]),
        .library(name: .singlePlural, targets: [.singlePlural]),
        .library(name: .string, targets: [.string]),
        .library(name: .translated, targets: [.translated]),
        .library(name: .translatedString, targets: [.translatedString]),
        .library(name: .dateFormattedLocalized, targets: [.dateFormattedLocalized])
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.1.5")
    ],
    targets: [
        .target(
            name: .translating,
            dependencies: [
                .language,
                .languageDependency,
                .locale,
                .singlePlural,
                .string,
                .translated,
                .translatedString,
                .dateFormattedLocalized
            ]
        ),
        .testTarget(
            name: .translating.tests,
            dependencies: [
                .translating
            ]
        ),
        .target(name: .language),
        .testTarget(
            name: .language.tests,
            dependencies: [.language]
        ),
        .target(
            name: .languageDependency,
            dependencies: [
                .language,
                .string,
                .translated,
                .translatedString,
                .dependencies
            ]
        ),
        .testTarget(
            name: .languageDependency.tests,
            dependencies: [.languageDependency]
        ),
        .target(
            name: .locale,
            dependencies: [.language]
        ),
        .testTarget(
            name: .locale.tests,
            dependencies: [.locale]
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
            dependencies: [.singlePlural]
        ),
        .target(
            name: .string,
            dependencies: [
                .language,
                .locale
            ]
        ),
        .testTarget(
            name: .string.tests,
            dependencies: [.string]
        ),
        .target(
            name: .translated,
            dependencies: [
                .language,
                .dependencies
            ]
        ),
        .testTarget(
            name: .translated.tests,
            dependencies: [.translated]
        ),
        .target(
            name: .translatedString,
            dependencies: [
                .language,
                .translated,
                .string
            ]
        ),
        .testTarget(
            name: .translatedString.tests,
            dependencies: [.translatedString]
        ),
        .target(
            name: .dateFormattedLocalized,
            dependencies: [.dependencies]
        ),
        .testTarget(
            name: .dateFormattedLocalized.tests,
            dependencies: [.dateFormattedLocalized]
        )
    ]
)

extension String {
    var tests: Self { "\(self) Tests" }
}
