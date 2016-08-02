import PackageDescription

let package = Package(
    name: "InfrastructureToolkit",
    targets: [
        Target(name: "InfrastructureToolkit"),
    ],
    dependencies: [ ],
    exclude: [ "example" ]
)
