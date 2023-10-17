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
            url: "https://github.com/phrase/ios-sdk/releases/download/4.3.2/PhraseSDK.xcframework.zip",
            checksum: "536654475a1cfd676ee683c226380c2a77f2df7ca03dade62ab5864d31a12a24"
        ),
    ]
)
