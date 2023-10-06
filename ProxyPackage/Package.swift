// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ProxyPackage",
  platforms: [.iOS(.v15)],
  products: [
    .library(
      name: "ProxyPackage",
      targets: [
        "ProxyPackage",
      ]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/CombineCommunity/CombineExt", revision: "36e8564f9f8ab8fe020884739066b9a5379b9a6b"),
    .package(url: "https://github.com/nsoojin/CombineRIBs", exact: "2.1.0"),
    .package(url: "https://github.com/roberthein/TinyConstraints", exact: "4.0.2"),
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", exact: "1.2.0"),
  ],
  targets: [
    .target(
      name: "ProxyPackage",
      dependencies: [
        .product(name: "CombineRIBs", package: "CombineRIBs"),
        .product(name: "TinyConstraints", package: "TinyConstraints"),
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ],
      path: "ProxyPackage"
    ),
  ]
)
