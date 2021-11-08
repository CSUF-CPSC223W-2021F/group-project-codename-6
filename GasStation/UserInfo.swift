//
//  UserInfo.swift
//  GasStation
//
//  Created by nebil on 11/7/21.
//

import Foundation

class UserInfo : Codable{
    
    var name:String
    var email:String
    var password:String
    
   // var locationThatDriveGotGas:[CLLocationCoordinate2D]
    
    init(name:String,email:String,password:String) {
        
        self.name = name
        self.email = email
        self.password = password
       // locationThatDriveGotGas  = [CLLocationCoordinate2D]()
        

    }
    
    func getName() ->String {
        return self.name
    }
    func getEmail() -> String {
        return self.email
    }
    func getPassword() -> String {
        
      
        return self.password
    }
    
//
//    func getLocationThatDriverGotGas() -> [CLLocationCoordinate2D] {
//
//        return self.locationThatDriveGotGas
//    }
   
 
    func userInfo()  {
        
        print("\(getName()) || \(getEmail()) || \(getPassword())  ")
    }
    
}


