import Foundation

public class ServiceStatusMonitorExecutor : IServiceStatusMonitorExecutor {

    private let monitors : [ServiceStatusMonitor]

    public init(monitors: [ServiceStatusMonitor]) {
        self.monitors = monitors
    }

    public func execute(name: String) -> ServiceStatusResult {
        guard let monitor = self.findMonitorWithName(name: name) else {
            let metaData = ServiceStatusResultMetaData("Could not locate monitor", nil)
            let result = ServiceStatusResult(name: name, successful: false, metaData: metaData)
            return result
        }

        var result : ServiceStatusResult
        do {
            result = try monitor.checkIsHealthy()
        } catch {
            let properties : [String: String]? = nil
            let metaData = ServiceStatusResultMetaData("An Exception Occurred", properties)
            result = ServiceStatusResult(name: name, successful: false, metaData: metaData)
        }

        return result
    }

    public func executeAll() -> [ServiceStatusResult] {
      return self.monitors.map( {
        (monitor : ServiceStatusMonitor) -> ServiceStatusResult in
          return self.execute(name: monitor.name)
      })
    }

    public func exists(name: String) -> Bool {
      let monitor = self.findMonitorWithName(name: name)
      return monitor != nil
    }

    // Private methods
    private func findMonitorWithName(name: String) -> ServiceStatusMonitor? {
        let matchingMonitors = self.monitors.filter({ (monitor: ServiceStatusMonitor) in
            return monitor.name.localizedCaseInsensitiveCompare(name) == ComparisonResult.orderedSame
        })

        // if we can't locate the exact monitor - don't bother
        if (matchingMonitors.count != 1) {
            return nil
        }

        return matchingMonitors.first
    }

}
