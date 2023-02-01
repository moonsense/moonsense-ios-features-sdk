// swift-tools-version:5.3

import PackageDescription
import class Foundation.ProcessInfo

let package = Package(
    name: "FeaturesSDK",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "FeaturesSDK",
            targets: ["FeaturesSDK"]),
        .library(
            name: "FeaturesSDK-static",
            targets: ["FeaturesSDK-static"])
    ],
    targets: [
        .binaryTarget(
            name: "FeaturesSDK",
            url: "https://dl.moonsense.io/basic/sdk/raw/names/FeaturesSDK.xcframework/versions/0.2.0/FeaturesSDK.xcframework-0.2.0.zip",
            checksum: "994e0fc2ff80a441bd5d4fc3074ebfa95d57eb1afbca0717160bd7b4a5b2fc4b"
        ),
        .binaryTarget(
            name: "FeaturesSDK-static",
            url: "https://dl.moonsense.io/basic/sdk/raw/names/FeaturesSDK-static.xcframework/versions/0.2.0/FeaturesSDK-static.xcframework-0.2.0.zip",
            checksum: "4c46099b5dc28c2081646183d2709d34bc98df12a6f4a2fb6612574367b7f559"
        )
    ]
)

if ProcessInfo.processInfo.environment["MOONSENSE_INCLUDE_CORE_PACKAGES"] != nil {
    package.products.append(Product.library(name: "FeaturesCoreSDK", targets: ["FeaturesCoreSDK"]))
    package.targets.append(Target.binaryTarget(name: "FeaturesCoreSDK",
                                               url: "https://dl.moonsense.io/basic/sdk/raw/names/FeaturesCoreSDK.xcframework/versions/0.2.0/FeaturesCoreSDK.xcframework-0.2.0.zip",
                                               checksum: "361b87f0b235c9082b5436fc2aa96f8fa9213b329646ca7bc5a9aadd3e96a031"))

    package.products.append(Product.library(name: "FeaturesCoreSDK-static", targets: ["FeaturesCoreSDK-static"]))
    package.targets.append(Target.binaryTarget(name: "FeaturesCoreSDK-static",
                                               url: "https://dl.moonsense.io/basic/sdk/raw/names/FeaturesCoreSDK-static.xcframework/versions/0.2.0/FeaturesCoreSDK-static.xcframework-0.2.0.zip",
                                               checksum: "1ccab173b6153d735f44cefbb1f9ecba0382cfed3583405da0ef5382f686b604"))
}
