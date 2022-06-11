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
            url: "https://github.com/phrase/ios-sdk/releases/download/4.0.1/PhraseSDK.xcframework.zip",
            checksum: "ff8e19d1a3ddd21ff3b7ccfb6daa451f2eae3ba5e0cf856009ea81fdcc9da8a1"
        ),
    ]
)
