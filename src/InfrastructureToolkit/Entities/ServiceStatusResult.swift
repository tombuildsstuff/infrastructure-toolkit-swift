import Foundation

@objc
public class ServiceStatusResult : NSObject {
    public let name : String
    public let successful : Bool
    public let metaData : ServiceStatusResultMetaData?

    init(name: String, successful: Bool, metaData: ServiceStatusResultMetaData?) {
      self.name = name
      self.successful = successful
      self.metaData = metaData
    }
}
