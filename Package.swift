// swift-tools-version:5.10.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension [Package.Dependency] {
    static let `default`: Self = [
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.1.5"),
//        .package(url: "https://github.com/tenthijeboonkkamp/toolkit.git", branch: "main")
    ]
}

extension String {
    static let languages: Self = "Languages"

    static let language: Self = "Language"
    static let dependency: Self = "Language Dependency"
    static let locale: Self = "Locale"
    static let singlePlural: Self = "SinglePlural"
    static let string: Self = "String"
    static let translated: Self = "Translated"
    static let translatedString: Self = "TranslatedString"
}

extension Target.Dependency {
    static let language: Self = .target(name: .language)
    static let dependency: Self = .target(name: .dependency)
    static let locale: Self = .target(name: .locale)
    static let singlePlural: Self = .target(name: .singlePlural)
    static let string: Self = .target(name: .string)
    static let translated: Self = .target(name: .translated)
    static let translatedString: Self = .target(name: .translatedString)
}

extension Target.Dependency {
    static let dependencies: Self = .product(name: "Dependencies", package: "swift-dependencies")
//    static let toolkit: Self = .product(name: "ToolKit", package: "toolkit")
}

extension [Target.Dependency] {
    static let shared: Self = [
//        .toolkit
    ]
}

extension Package {
    static func language(
        targets: [(
            name: String,
            dependencies: [Target.Dependency]
        )]
    ) -> Package {

        let names = targets.map(\.name)

        return Package(
            name: "swift-language",
            platforms: [
                .macOS(.v13),
                .iOS(.v13)
            ],
            products: [
                [
                    .library(
                        name: .languages,
                        targets: [.languages]
                    )
                ],
                [
                    .library(
                        name: .language,
                        targets: [.languages]
                    )
                ],
                names.map { target in
                    .library(
                        name: "\(target)",
                        targets: ["\(target)"]
                    )
                }
            ].flatMap { $0 },
            dependencies: .default,
            targets: [
                [
                    .target(
                        name: "Languages",
                        dependencies: [
                            .language,
                            .dependency,
                            .locale,
                            .singlePlural,
                            .string,
                            .translated,
                            .translatedString
                        ]
                    )
                ],

                targets.map { document in
                    Target.target(
                        name: "\(document.name)",
                        dependencies: .shared + [] + document.dependencies
                    )
                },
                targets.map { document in
                    Target.testTarget(
                        name: "\(document.name)Tests",
                        dependencies: [.init(stringLiteral: document.name)]
                    )
                }
            ].flatMap { $0 }
        )
    }
}

let package = Package.language(
    targets: [
        (
            name: .language,
            dependencies: [

            ]
        ),
        (
            name: .dependency,
            dependencies: [
                .language,
                .string,
                .translated,
                .translatedString,
                .dependencies
            ]
        ),
        (
            name: .locale,
            dependencies: [
                .language
            ]
        ),
        (
            name: .singlePlural,
            dependencies: [
                .language,
                .translated,
                .translatedString
            ]
        ),
        (
            name: .string,
            dependencies: [
                .language,
                .locale
            ]
        ),
        (
            name: .translated,
            dependencies: [
                .language
            ]
        ),
        (
            name: .translatedString,
            dependencies: [
                .language,
                .translated,
                .string
            ]
        )
    ]
)
