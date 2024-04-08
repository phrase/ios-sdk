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
            url: "https://github.com/phrase/ios-sdk/releases/download/4.4.1/PhraseSDK.xcframework.zip",
            checksum: "f6ee21bc30c603819e1bf953d71418fdc36c9556049bc51bd12a13c58afded16"
        ),
    ]
)
