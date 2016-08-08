public protocol IServiceStatusMonitorExecutor {

  func execute(name: String) -> ServiceStatusResult

}
