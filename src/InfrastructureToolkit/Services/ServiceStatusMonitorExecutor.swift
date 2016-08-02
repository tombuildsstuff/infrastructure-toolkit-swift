import Foundation

class ServiceStatusMonitorExecutor {

    let monitors : [ServiceStatusMonitor]

    init(monitors: [ServiceStatusMonitor]) {
        self.monitors = monitors
    }

    func execute(name: String, done: (ServiceStatusResult) -> ()) {
        guard let monitor = self.findMonitorWithName(name: name) else {
            let metaData = ServiceStatusResultMetaData(summary: "Could not locate monitor", properties: nil)
            let result = ServiceStatusResult(name: name, successful: false, metaData: metaData)
            done(result)
            return
        }

        var result : ServiceStatusResult
        do {
            result = try monitor.checkIsHealthy()
        } catch {
            let properties : [String: String]? = nil
            let metaData = ServiceStatusResultMetaData(summary: "An Exception Occurred", properties: properties)
            result = ServiceStatusResult(name: name, successful: false, metaData: metaData)
        }

        done(result)
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
