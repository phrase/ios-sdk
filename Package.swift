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
            url: "https://github.com/phrase/ios-sdk/releases/download/4.3.3/PhraseSDK.xcframework.zip",
            checksum: "55de8eb774152869b9d2ffe1e6f09d425607b5ea51631de524cda222411e812c"
        ),
    ]
)
