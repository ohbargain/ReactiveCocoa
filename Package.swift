// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "ReactiveCocoa",
    platforms: [
        .macOS(.v10_12), .iOS(.v10), .tvOS(.v10), .watchOS(.v3)
    ],
    products: [
        .library(name: "ReactiveCocoa", targets: ["ReactiveCocoa"])
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveCocoa/ReactiveSwift", from: "7.0.0"),
        .package(url: "https://github.com/Quick/Quick.git", from: "4.0.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "9.0.0"),
    ],
    targets: [
        .target(
            name: "ReactiveCocoaObjC",
            dependencies: [],
            path: "ReactiveCocoaObjC"),

        .target(
            name: "ReactiveCocoa",
            dependencies: ["ReactiveSwift", "ReactiveCocoaObjC"],
            path: "ReactiveCocoa"),

        .target(
            name: "ReactiveCocoaObjCTestSupport",
            path: "ReactiveCocoaObjCTestSupport"),

        .testTarget(
            name: "ReactiveCocoaTests",
            dependencies: [
                "ReactiveCocoa",
                "ReactiveCocoaObjCTestSupport",
                "Quick",
                "Nimble"
            ],
            path: "ReactiveCocoaTests"),
    ],
    swiftLanguageVersions: [.v5]    
)
