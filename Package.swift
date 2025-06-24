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
            url: "https://github.com/phrase/ios-sdk/releases/download/5.1.0/PhraseSDK.xcframework.zip",
            checksum: "ab1fcb772b0d26db7850da5d0130c0cdd08ceb5d6212d4e24cbd73165220fc46"
        ),
    ]
)
