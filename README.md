# Swift Infrastructure Toolkit

## Fundamentals
The Infrastructure Toolkit has a very basic aim - to ensure your system works correctly.

So that we're all on the same page - throughout this README - we'll be referring to several terms - which are defined in this context in the following ways:

  - Service Status Monitor
    - _These check your code paths that you define to ensure they're healthy. Generally these are either Dependencies, Metrics or other Critical Code Paths. These should be called on a schedule by your Monitoring System_
  - Monitoring System
    - _A system which monitors the uptime of other systems - Sensu, Nagios or Pingdom are examples that hits Endpoints in your application_

Fundamentally - the Infrastructure Toolkit just executes the Service Status Monitors - and reports back whether they were successful or not.

This Toolkit is intentionally generic, not relying on any particular Framework - meaning you can plug it into what you need too, be this [Vapor](https://github.com/qutheory/vapor), [Kitura](https://github.com/IBM-Swift/Kitura) or to something else all-together.

## Integrations
There's integrations for the following Frameworks:
 - [Vapor](https://github.com/tombuildsstuff/infrastructure-toolkit-swift-vapor)
 - (PR's appreciated)

## Adding your own Service Status Monitors
Service Status Monitors implement the `ServiceStatusMonitor` protocol - as defined above, generally these will be checking either Dependencies, Metrics or some other code path you care about.

In this sample code below - we'll just return that things are successful - to highlight that it works.

```
class ExampleServiceStatusMonitor : ServiceStatusMonitor {
    let name: String = "Example"

    func checkIsHealthy() throws -> ServiceStatusResult {
        return ServiceStatusResult(name: self.name, successful: true, metaData: nil)
    }
}
```

## Executing a single Service Status Monitor

In code - we can then execute the single Service Status Monitor outlined above by using the following code:
```
let monitors = [ ExampleServiceStatusMonitor() ]
let executor = ServiceStatusMonitorExecutor(monitors: monitors)
executor.execute(name: "example", done: {
    (result: ServiceStatusResult) in
    print("\(result.name) - \(result.successful)")
})
```

If you're using one of the Integrations outlined above - the `Name` field is used as part of the URL - making it accessible by the URL `/service-status/example`.

## Executing All Service Status Monitors
It's also possible to execute all of the Service Status Monitors - which you'd generally want to do at Deployment time.

```
TODO: implement me
```
