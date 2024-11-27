// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "PhraseSDK",
    platforms: [
        .iOS(.v12)
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
            url: "https://github.com/phrase/ios-sdk/releases/download/4.4.2/PhraseSDK.xcframework.zip",
            checksum: "e2e05757da1b04f489edc46cf645dfa1d04cf13200b6b020d0d4c3510cee42b4"
        ),
    ]
)
