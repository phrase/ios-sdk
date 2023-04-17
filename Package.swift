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
            url: "https://github.com/phrase/ios-sdk/releases/download/4.2.0/PhraseSDK.xcframework.zip",
            checksum: "490d993839affcedb30f30dbfe16c50ca1ed7e7d7f3524a840bca94e4d0c1fc3"
        ),
    ]
)
