// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode",
    platforms: [.macOS(.v10_15)],
    products: [
        .executable(name: "AdventOfCode", targets: ["AdventOfCode"]),
        .library(name: "Day1", targets: ["Day1"]),
        .library(name: "Day2", targets: ["Day2"]),
        .library(name: "Day3", targets: ["Day3"]),
        .library(name: "Day4", targets: ["Day4"]),
        .library(name: "Day5", targets: ["Day5"]),
        .library(name: "Day6", targets: ["Day6"]),
        .library(name: "Day7", targets: ["Day7"]),
        .library(name: "Day8", targets: ["Day8"])],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: "https://github.com/paulicelli/Tree", from: "0.0.3"),
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
            name: "Day3",
            dependencies: [],
            path: "Sources/Day3",
            resources: [
                .copy("day3.txt")
            ]),
        .target(
            name: "Day4",
            dependencies: [],
            path: "Sources/Day4",
            resources: [
                .copy("day4.txt")
            ]),
        .target(
            name: "Day5",
            dependencies: [],
            path: "Sources/Day5",
            resources: [
                .copy("day5.txt")
            ]),
        .target(
            name: "Day6",
            dependencies: [],
            path: "Sources/Day6",
            resources: [
                .copy("day6.txt")
            ]),
        .target(
            name: "Day7",
            dependencies: [],
            path: "Sources/Day7",
            resources: [
                .copy("day7.txt"),
                .copy("day7test1.txt"),
                .copy("day7test2.txt"),
            ]),
        .target(
            name: "Day8",
            dependencies: [],
            path: "Sources/Day8",
            resources: [
                .copy("day8.txt"),
                .copy("day8test1.txt"),
            ]),
        .target(
            name: "AdventOfCode",
            dependencies: ["Day1", "Day2", "Day3", "Day4", "Day5", "Day6", "Day7", "Day8"]),
        .testTarget(
            name: "AdventOfCodeTests",
            dependencies: ["AdventOfCode"]),
        .testTarget(
            name: "Day1Tests",
            dependencies: ["Day1"]),
    ]
)
