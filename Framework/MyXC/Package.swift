// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "MyXC",
    platforms: [
        .iOS(.v15) // Adjust platform as needed
    ],
    products: [
        .library(
            name: "MyXC",
            targets: ["MyXC"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "MyXC",
            path: "./MyXC.xcframework" // Relative path to the xcframework
        )
    ]
)
