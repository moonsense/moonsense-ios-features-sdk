# Moonsense iOS Features SDK

## Introduction

This repository hosts the `Package.swift` Swift Package Manager file for the Moonsense iOS Features SDK. The Moonsense iOS Features SDK is available as two variants: a dynamically linked `.xcframework` and a statically linked `.xcframework`. This repository also hosts a sample application that demonstrate the use of the Moonsense iOS Features SDK.

### `FeaturesSDK.xcframework`

The `FeaturesSDK.xcframework` contains the dynamically linked variant of the Moonsense iOS Features SDK. When using the dynamically linked variant of the SDK, you must embed the framework within your target so the OS can load it at runtime. This approach works fine if you are building an application that directly consumes the SDK or are building your own framework that is being used internally. If you are building a framework that you are providing to another party and you don't wish for them to see that your framework depends on the Moonsense iOS Features SDK, see the `FeaturesSDK-static.xcframework` section below.

### `FeaturesSDK-static.xcframework`

The `FeaturesSDK-static.xcframework` contains the statically linked variant of the Moonsense iOS Features SDK. When using the statically linked variant of the SDK, the linker will embed the necessary code from the SDK into your target. The `FeaturesSDK-static.xcframework` should **NOT** be embedded into your target. If you are building a framework that you are providing to another party, they will only see your public API and not the Moonsense iOS Features SDK public API.

## TLDR

- Clone this repository.
- Configure your `.netrc` file with your `REPO_ACCESS_TOKEN`.
- Open the `FeaturesSamples.xcworkspace` Xcode workspace in Xcode.
- Create a public token on the [Moonsense Console](https://console.moonsense.cloud/) for your application.
- Add the public token to the `publicToken` variable in `ViewController.swift` in the `FeaturesSampleApp`.
- Run the `FeaturesSampleApp` on your iOS device.

## Version History

The latest release of the SDK is `0.1.0`. Details about the current and past releases can be found [here](https://github.com/moonsense/moonsense-ios-features-sdk/releases/).

## Prerequisites

- Xcode 13.0+
- Swift projects must use Swift 5.0 or greater
- Deployment target of iOS 11.0 or greater

## Integrating the SDK

### Configuring `.netrc` for Authorizing Downloads

Downloading the Moonsense iOS Features SDK artifacts requires a `REPO_ACCESS_TOKEN` for `dl.moonsense.io`. This token is associated to your Moonsense Account and should have been provided to you. In case you do not have one contact [support@moonsense.io](mailto:support@moonsense.io). Add the following to your `~/.netrc` file:

```
machine dl.moonsense.io
  login token
  password <REPO_ACCESS_TOKEN>
  protocol https

```

### Swift Package Manager

The Moonsense iOS Features SDK is available as a Swift Package. Simply use the link to the [`moonsense-ios-features-sdk`](https://github.com/moonsense/moonsense-ios-features-sdk) repo, https://github.com/moonsense/moonsense-ios-features-sdk, as the Package URL when adding the Swift Package to your project.

### Cocoapods

Cocoapods distribution is not currently available but will be supported in an upcoming release.

### Manual Integration

The `FeaturesSDK.xcframework.zip`, `FeaturesSDK-static.xcframework.zip` and `FeaturesSDK.doccarchive.zip` artifacts can also be manually integrated into your project. You can download the latest versions from the following links:

* [`FeaturesSDK.xcframework.zip`](https://dl.moonsense.io/basic/sdk/raw/names/FeaturesSDK.xcframework/versions/0.1.0/FeaturesSDK.xcframework-0.1.0.zip)
* [`FeaturesSDK-static.xcframework.zip`](https://dl.moonsense.io/basic/sdk/raw/names/FeaturesSDK-static.xcframework/versions/0.1.0/FeaturesSDK-static.xcframework-0.1.0.zip)
* [`FeaturesSDK.doccarchive.zip`](https://dl.moonsense.io/basic/sdk/raw/names/FeaturesSDK.doccarchive/versions/0.1.0/FeaturesSDK.doccarchive-0.1.0.zip)

Once downloaded, unzip the files and drop the expanded files into your project.

*Note:* The downloads require the authorization token as outlined above. For best results download the artifacts using `curl` with the `-n` option. For example:

```
curl -n -o FeaturesSDK.xcframework.zip https://dl.moonsense.io/basic/sdk/raw/names/FeaturesSDK.xcframework/versions/0.1.0/FeaturesSDK.xcframework-0.1.0.zip
```

## Sample Applications

The [`moonsense-ios-features-sdk`](https://github.com/moonsense/moonsense-ios-features-sdk) GitHub repository contains a sample application that demonstrates the integration and use of the Moonsense iOS Features SDK. To get started, open the `FeaturesSamples.xcworkspace` Xcode Workspace.

- [`FeaturesSampleApp`](https://github.com/moonsense/moonsense-ios-features-sdk/tree/main/FeaturesSampleApp) - This sample app demonstrates the use of the Moonsense iOS Features SDK within a simple application. The example in this case is quite simple and minimal and can serve as a good starting point for developers looking for a quick integration. The `FeaturesSampleApp` Xcode project contains two targets, `FeaturesSampleApp` and `FeaturesSampleApp-Static`. The `FeaturesSampleApp` target consumes the `FeaturesSDK.xcframework` dynamically linked variant. The `FeaturesSampleApp-Static` target consumes the `FeaturesSDK-static.xcframework` target.

## Terms Of Service

The Moonsense iOS Features SDK is distributed under the [Moonsense Terms Of Service](https://www.moonsense.io/terms-of-service).

## Support

Feel free to raise an [Issue](https://github.com/moonsense/moonsense-ios-features-sdk/issues) around bugs, usage, concerns or feedback.
