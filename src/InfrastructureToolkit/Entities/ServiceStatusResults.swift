import Foundation

@objc
class ServiceStatusResults : NSObject {

  let monitorResults : [ServiceStatusResult]

  let successful : Bool

  init(monitorResults: [ServiceStatusResult]) {
    self.monitorResults = monitorResults
    self.successful = monitorResults.map({ (result) in
      return !result.successful
    }).count == 0
  }

}
