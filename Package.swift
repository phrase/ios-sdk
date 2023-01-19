// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PhraseSDK",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "PhraseSDK",
            targets: ["PhraseSDK"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "PhraseSDK",
            url: "https://github.com/phrase/ios-sdk/releases/download/4.1.0/PhraseSDK.xcframework.zip",
            checksum: "9d4c419aaa61e0e3c2f5f065b02cfe0e41a97e9d8a1a60adbf9d7eed4f6aed0d"
        ),
    ]
)
