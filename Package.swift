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
            url: "https://github.com/phrase/ios-sdk/releases/download/4.3.4/PhraseSDK.xcframework.zip",
            checksum: "d90a1fd951ed5ac4788de89ea6500c84d8f31ddb2fe1913b4e96e56411797726"
        ),
    ]
)
