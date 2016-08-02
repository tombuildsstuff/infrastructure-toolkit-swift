import Foundation

@objc
protocol ServiceStatusMonitor {
    var name : String { get }

    func checkIsHealthy() throws -> ServiceStatusResult
}
