
import Foundation

class SharedData{
    static let shared = SharedData()
    
    var name : String?
    var contact : String?
    var email : String?
    var address : String?
    
    var collegeName : String?
    var collegeDate : String?
    var degree : String?
    var percentage : String?
    
    var compamyName : String?
    var companyDate : String?
    var workDetails : String?
    
    var skills : [String]?
    
    private init() {}
}
