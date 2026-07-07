// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "YNSearch",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "YNSearch", targets: ["YNSearch"])
    ],
    targets: [
        .target(
            name: "YNSearch",
            path: "YNSearch",
            exclude: [
                "YNSearch.h",
                "Info.plist"
            ],
            resources: [
                .process("YNSearch.xcassets")
            ],
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        ),
        .testTarget(
            name: "YNSearchTests",
            dependencies: ["YNSearch"],
            path: "Tests/YNSearchTests",
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        )
    ]
)
