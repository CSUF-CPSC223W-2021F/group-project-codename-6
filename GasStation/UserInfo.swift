//
//  UserInfo.swift
//  GasStation
//
//  Created by nebil on 11/7/21.
//

import Foundation

class UserInfo : Codable{
    
    var firstname:String
    var lastname: String
    var email:String
    var password:String
    var phonenumber:String
    var homeaddress:String
    var birthdate:String
    var username:String
    
   // var locationThatDriveGotGas:[CLLocationCoordinate2D]
    
    init(firstname:String, lastname:String, username:String, email:String, password:String,  phonenumber:String, address:String, birthdate:String ) {
        
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
        self.phonenumber = phonenumber
        self.homeaddress = address
        self.birthdate = birthdate
        self.username = username
       // locationThatDriveGotGas  = [CLLocationCoordinate2D]()
        

    }
    
    func getfirstName() ->String {
        return self.firstname
    }
    func getlastName()->String{
        return self.lastname
    }
    func getUsername()-> String{
        return self.username
    }
    func getEmail() -> String {
        return self.email
    }
    func getPassword() -> String {
        return self.password
    }
    func getPhone() ->String{
        return self.phonenumber
    }
    func getAddress()-> String{
        return self.homeaddress
    }
    func getBirthDate()->String{
        return self.birthdate
    }

    
//
//    func getLocationThatDriverGotGas() -> [CLLocationCoordinate2D] {
//
//        return self.locationThatDriveGotGas
//    }
   
 
    func userInfo()  {
        
        print("\(getfirstName()) || \(getlastName()) || \(getUsername()) || \(getEmail()) || \(getPassword()) || \(getPhone()) || \(getAddress()) || \(getBirthDate())  ")
    }
    
}


