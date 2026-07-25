# swift-translating

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Type-safe string translation and pluralization for Swift.

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-foundations/swift-translating.git", from: "0.1.1")
]
```

Add the product to your target:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "Translating", package: "swift-translating")
    ]
)
```

## License

Apache 2.0. See [LICENSE](LICENSE.md).
