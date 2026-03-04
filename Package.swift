// swift-tools-version: 5.9

/*
 * Copyright (c) 2022-2026 GS1 AISBL.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 *
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import PackageDescription

let package = Package(
    name: "GS1Encoders",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "GS1Encoders",
            targets: ["GS1Encoders"]),
    ],
    targets: [
        .target(
            name: "CGS1Encoders",
            dependencies: [],
            path: "src/swift/Sources/CGS1Encoders",
            exclude: [
                "c-lib/gs1encoders-app.c",
                "c-lib/gs1encoders-test.c",
                "c-lib/gs1encoders-fuzzer-ais.c",
                "c-lib/gs1encoders-fuzzer-data.c",
                "c-lib/gs1encoders-fuzzer-dl.c",
                "c-lib/gs1encoders-fuzzer-scandata.c",
                "c-lib/gs1encoders-fuzzer-syn.c",
                "c-lib/acutest.h",
                "c-lib/syntax/acutest.h",
                "c-lib/syntax/unittest.h",
                "c-lib/Makefile",
                "c-lib/build-embedded-ai-table.pl",
                "c-lib/gs1encoders.vcxproj",
                "c-lib/gs1encoders.vcxproj.filters",
                "c-lib/gs1encoders-app.vcxproj",
                "c-lib/gs1encoders-app.vcxproj.filters",
                "c-lib/gs1encoders-test.vcxproj",
                "c-lib/gs1encoders-test.vcxproj.filters",
                "c-lib/aitable.inc",
                "c-lib/README.md"
            ],
            resources: [
                .copy("c-lib/gs1-syntax-dictionary.txt")
            ],
            cSettings: [
                .define("PRNT", to: "0"),
                .define("GS1_LINTER_ERR_STR_EN"),
                .headerSearchPath("include"),
                .headerSearchPath("c-lib"),
                .headerSearchPath("c-lib/syntax")
            ]
        ),
        .target(
            name: "GS1Encoders",
            dependencies: ["CGS1Encoders"],
            path: "src/swift/Sources/GS1Encoders"),
    ]
)