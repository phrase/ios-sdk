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
            url: "https://github.com/phrase/ios-sdk/releases/download/3.0.1/PhraseSDK.xcframework.zip",
            checksum: "bbbd4df66502308e6f17cb2d9bfbeb33765c6f9aeb1cb9246c4535791094d2ce"
        ),
    ]
)
