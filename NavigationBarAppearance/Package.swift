// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "NavigationBarAppearance",
  platforms: [
    .iOS("14.0")
  ],
  products: [
    .library(
      name: "NavigationBarAppearance",
      targets: ["NavigationBarAppearance"]
    )
  ],
  targets: [
    .target(name: "NavigationBarAppearance"),
    .testTarget(
      name: "NavigationBarAppearanceTests",
      dependencies: ["NavigationBarAppearance"]
    )
  ]
)
