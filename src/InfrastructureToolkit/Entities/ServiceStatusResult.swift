import Foundation

@objc
class ServiceStatusResult : NSObject {
    let name : String
    let successful : Bool
    let metaData : ServiceStatusResultMetaData?

    init(name: String, successful: Bool, metaData: ServiceStatusResultMetaData?) {
      self.name = name
      self.successful = successful
      self.metaData = metaData
    }
}
