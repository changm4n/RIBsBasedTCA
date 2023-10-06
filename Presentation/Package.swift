// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Presentation",
  platforms: [.iOS(.v15)],
  products: [
    .library(
      name: "PresentationImp",
      targets: [
        "Main",
        "MainImp",
        "Bridge",
        "BridgeImp",
      ]
    ),
  ],
  dependencies: [
    .package(path: "../ProxyPackage"),
  ],
  targets: [
    .target(
      name: "Main",
      dependencies: [
        .product(name: "ProxyPackage", package: "ProxyPackage"),
      ],
      path: "Main/Interface"
    ),
    .target(
      name: "MainImp",
      dependencies: [
        "Main",
        "Bridge",
        .product(name: "ProxyPackage", package: "ProxyPackage"),
      ],
      path: "Main/Implementation"
    ),
    .target(
      name: "Bridge",
      dependencies: [
        .product(name: "ProxyPackage", package: "ProxyPackage"),
      ],
      path: "Bridge/Interface"
    ),
    .target(
      name: "BridgeImp",
      dependencies: [
        "Bridge",
        .product(name: "ProxyPackage", package: "ProxyPackage"),
      ],
      path: "Bridge/Implementation"
    ),
  ]
)
