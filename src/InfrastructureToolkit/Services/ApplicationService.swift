import Foundation

class ApplicationService {

  func version() -> String {
    return Bundle.main.infoDictionary?["CFBundleVersion"] as! String
  }

}
