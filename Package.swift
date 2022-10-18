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
            url: "https://dl.moonsense.io/basic/sdk/raw/names/FeaturesSDK.xcframework/versions/0.1.0-alpha1/FeaturesSDK.xcframework-0.1.0-alpha1.zip",
            checksum: "74b1598747f4662b63334a0be08514da049593dbc08f7171299bea0bfaf2855c"
        ),
        .binaryTarget(
            name: "FeaturesSDK-static",
            url: "https://dl.moonsense.io/basic/sdk/raw/names/FeaturesSDK-static.xcframework/versions/0.1.0-alpha1/FeaturesSDK-static.xcframework-0.1.0-alpha1.zip",
            checksum: "ce4963175e0d148aa4c45c7a08ffb0d20d17a3bcadba65a0c04a726432b43f05"
        )
    ]
)

if ProcessInfo.processInfo.environment["MOONSENSE_INCLUDE_CORE_PACKAGES"] != nil {
    package.products.append(Product.library(name: "FeaturesCoreSDK", targets: ["FeaturesCoreSDK"]))
    package.targets.append(Target.binaryTarget(name: "FeaturesCoreSDK",
                                               url: "https://dl.moonsense.io/basic/sdk/raw/names/FeaturesCoreSDK.xcframework/versions/0.1.0-alpha1/FeaturesCoreSDK.xcframework-0.1.0-alpha1.zip",
                                               checksum: "2d439358072e62308f315e5f77bec6afdf9dd7af11f236198e36d628fe7b1a84"))

    package.products.append(Product.library(name: "FeaturesCoreSDK-static", targets: ["FeaturesCoreSDK-static"]))
    package.targets.append(Target.binaryTarget(name: "FeaturesCoreSDK-static",
                                               url: "https://dl.moonsense.io/basic/sdk/raw/names/FeaturesCoreSDK-static.xcframework/versions/0.1.0-alpha1/FeaturesCoreSDK-static.xcframework-0.1.0-alpha1.zip",
                                               checksum: "0aecfc03ce7ffa2a97105ae629757c04c5dcfdfafd768a04753ff422a09a160f"))
}
