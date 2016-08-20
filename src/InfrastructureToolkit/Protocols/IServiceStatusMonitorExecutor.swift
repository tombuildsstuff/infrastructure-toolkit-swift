public protocol IServiceStatusMonitorExecutor {

  func execute(name: String) -> ServiceStatusResult

  func exists(name: String) -> Bool

}
