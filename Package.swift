// swift-tools-version:5.7

import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "ChatGPTScadeApp",
     platforms: [ .iOS(.v15), .macOS(.v12)],
    products: [
        .library(
            name: "ChatGPTScadeApp",
            type: .static,
            targets: [
                "ChatGPTScadeApp"
            ]
        )
    ],
    dependencies: [
       .package(name: "ChatGPTSwift", url: "https://github.com/alfianlosari/ChatGPTSwift.git", .branch("main")),
    ],
    targets: [
        .target(
            name: "ChatGPTScadeApp",
            dependencies: [
            	 .product(name: "ChatGPTSwift", package: "ChatGPTSwift"),
            ],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)