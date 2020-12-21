// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode",
    products: [
        .executable(name: "AdventOfCode", targets: ["AdventOfCode"]),
        .library(name: "Day1", targets: ["Day1"]),
        .library(name: "Day2", targets: ["Day2"])],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Day1",
            dependencies: [],
            path: "Sources/Day1",
            resources: [
                .copy("day1.txt")
            ]),
        .target(
            name: "Day2",
            dependencies: [],
            path: "Sources/Day2",
            resources: [
                .copy("day2.txt")
            ]),
        .target(
            name: "AdventOfCode",
            dependencies: ["Day1", "Day2"]),
        .testTarget(
            name: "AdventOfCodeTests",
            dependencies: ["AdventOfCode"]),
        .testTarget(
            name: "Day1Tests",
            dependencies: ["Day1"]),
    ]
)
