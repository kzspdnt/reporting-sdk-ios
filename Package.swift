// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Euvic Mobile SDK",
    platforms: [.iOS(.v13)],
    products: [.library(name: "EuvicMobileSDK", targets: ["EuvicMobileSDK"])],
    targets: [.binaryTarget(name: "EuvicMobileSDK", path: "./Framework/EuvicMobileSDK.xcframework")],
    swiftLanguageVersions: [.v5]
)