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
            url: "https://github.com/phrase/ios-sdk/releases/download/5.1.0-beta/PhraseSDK.xcframework.zip",
            checksum: "d6b6563e87d0e779c049a13c6b547d610ac26cd5ee81dc3a4ba42e9e02f28451"
        ),
    ]
)
