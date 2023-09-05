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
            url: "https://github.com/phrase/ios-sdk/releases/download/4.3.0/PhraseSDK.xcframework.zip",
            checksum: "60cf2d09f706e4c5cb19100ef437dcb12322eed598b995354a826c737782566e"
        ),
    ]
)
