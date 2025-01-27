// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "PhraseSDK",
    platforms: [
        .iOS(.v15)
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
            url: "https://github.com/phrase/ios-sdk/releases/download/5.0.0/PhraseSDK.xcframework.zip",
            checksum: "ce8cd6bfe0d3fdf2ddfacba1b5561792006fccdcc0ed0fde3149f4b50a4a0ae2"
        ),
    ]
)
