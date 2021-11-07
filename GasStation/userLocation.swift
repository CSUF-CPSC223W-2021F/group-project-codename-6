//
//  find users location
//  GasStation
//
//  By Amritpaul Sidhu
//
import Foundation

struct userLocation {
    var user: String = ""
    var userName: String = ""
    var location: String = ""
    
    /*init(_ userName: String, at location: String)
    {
        self.userName = userName
        self.location = location
        self.user = ""
    }*/

    func findUser() -> String
    {
        return user
    }
    func findLocation() -> String
    {
        return location
    }
    func displayUserName() -> String
    {
        return userName
    }
}
