public protocol IServiceStatusMonitorExecutor {

  func execute(name: String) -> ServiceStatusResult

  func executeAll() -> [ServiceStatusResult]

  func exists(name: String) -> Bool

}
