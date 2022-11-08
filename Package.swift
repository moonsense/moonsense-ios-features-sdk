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
            url: "https://dl.moonsense.io/basic/sdk/raw/names/FeaturesSDK.xcframework/versions/0.1.0/FeaturesSDK.xcframework-0.1.0.zip",
            checksum: "458e4994315aec753b51b084b99cd967adc1ee66a4deceb06aa581102e153606"
        ),
        .binaryTarget(
            name: "FeaturesSDK-static",
            url: "https://dl.moonsense.io/basic/sdk/raw/names/FeaturesSDK-static.xcframework/versions/0.1.0/FeaturesSDK-static.xcframework-0.1.0.zip",
            checksum: "c239e87dc0a95b15bc83a7c164ff8d1e4f9f9c4e025cb1069e3aaedd61ad8b24"
        )
    ]
)

if ProcessInfo.processInfo.environment["MOONSENSE_INCLUDE_CORE_PACKAGES"] != nil {
    package.products.append(Product.library(name: "FeaturesCoreSDK", targets: ["FeaturesCoreSDK"]))
    package.targets.append(Target.binaryTarget(name: "FeaturesCoreSDK",
                                               url: "https://dl.moonsense.io/basic/sdk/raw/names/FeaturesCoreSDK.xcframework/versions/0.1.0/FeaturesCoreSDK.xcframework-0.1.0.zip",
                                               checksum: "392dc077ec3c5087da0c1b28801279f5c3a4c53d85967467bb9c3c1f00cfb65e"))

    package.products.append(Product.library(name: "FeaturesCoreSDK-static", targets: ["FeaturesCoreSDK-static"]))
    package.targets.append(Target.binaryTarget(name: "FeaturesCoreSDK-static",
                                               url: "https://dl.moonsense.io/basic/sdk/raw/names/FeaturesCoreSDK-static.xcframework/versions/0.1.0/FeaturesCoreSDK-static.xcframework-0.1.0.zip",
                                               checksum: "327943d6731e21707380dfc56262c523edd60e03b0d98189bc607975f7d4bd3d"))
}
