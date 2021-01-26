// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PhraseSDK",
    platforms: [
        .iOS(.v9)
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
            url: "https://github.com/phrase/ios-sdk/releases/download/3.0.0/PhraseSDK.xcframework.zip",
            checksum: "5a2a2a53d1ae507f02d28d7d4a9238242fa154d3597166542ab6ca4487eb947e"
        ),
    ]
)
