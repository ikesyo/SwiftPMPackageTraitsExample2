// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPMPackageTraitsExample2",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftPMPackageTraitsExample2",
            targets: ["SwiftPMPackageTraitsExample2"]),
    ],
    traits: [
        "Hoge",
        "Fuga",
        .trait(
            name: "HogeFuga",
            enabledTraits: [
                "Hoge",
                "Fuga",
            ]
        ),
        .default(enabledTraits: []),
    ],
    dependencies: [
        .package(
            url: "https://github.com/ikesyo/SwiftPMPackageTraitsExample1",
            branch: "main",
            traits: [
                "Foo",
                .trait(name: "Bar", condition: .when(traits: ["Fuga"])),
                .trait(name: "FooBar", condition: .when(traits: ["HogeFuga"])),
            ],
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftPMPackageTraitsExample2",
            dependencies: [
                .product(
                    name: "SwiftPMPackageTraitsExample1",
                    package: "SwiftPMPackageTraitsExample1",
                ),
            ]
        ),
        .testTarget(
            name: "SwiftPMPackageTraitsExample2Tests",
            dependencies: ["SwiftPMPackageTraitsExample2"]
        ),
    ]
)
