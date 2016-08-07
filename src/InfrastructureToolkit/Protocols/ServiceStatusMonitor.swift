import Foundation

@objc
public protocol ServiceStatusMonitor {
    var name : String { get }

    func checkIsHealthy() throws -> ServiceStatusResult
}
