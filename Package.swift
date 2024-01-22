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
            url: "https://github.com/phrase/ios-sdk/releases/download/4.4.0/PhraseSDK.xcframework.zip",
            checksum: "35fa697f6cf99f9b69617717d714070493e5c6d9b07065d8a4fbfe2ccca16110"
        ),
    ]
)
