// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Benchmark",
    dependencies: [
        .package(url: "https://github.com/vapor/vapor", .upToNextMajor(from: "4.102.0")),
    ],
    targets: [
        .target(name: "main", dependencies: [.product(name: "Vapor", package: "vapor")], path: "."),
    ]
)
