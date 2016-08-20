public struct ServiceStatusResultMetaData {
    public let summary : String
    public let properties : [String : String]?

    public init(_ summary: String, _ properties: [String: String]?) {
      self.summary = summary
      self.properties = properties
    }
}
