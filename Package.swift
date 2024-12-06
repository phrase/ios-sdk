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
            url: "https://github.com/phrase/ios-sdk/releases/download/4.4.3/PhraseSDK.xcframework.zip",
            checksum: "7fddf03bff9470fe42adf9522574a9c009925af552740c4b4fb14889fb683b0a"
        ),
    ]
)
