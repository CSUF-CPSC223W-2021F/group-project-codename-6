//
//  AllUserData.swift
//  GasStation
//
//  Created by nebil on 11/7/21.
//

import Foundation
import UIKit



class AllUserData {

    var allUser = [UserInfo]()
    var succefulRegister = false
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("Item.plist")



 

    func addNewUser(user:UserInfo)  {
        getData()
        
        for userr in allUser {
            
          
            guard user.getEmail() != userr.getEmail() else {
                
                succefulRegister = false
                print("please use different email")
                let message = showAlertMessageView()
                //message.showMessage(myMessage: "please use different email")
                //self.showMessage(myMessage: "please use different email")
                return
            }
          
        }
        
        succefulRegister = true
        print("hello worlddddddddd")
        allUser.append(user)
        saveData()


    }
    
    
   
    
    func saveData()  {
        let encoder = PropertyListEncoder()
        
        do {

        
            let data = try encoder.encode(allUser)
            try data.write(to: dataFilePath)
            
           
            
            
        }catch {
        
            print("error occur\(error)")
        
        
        }
        
    }
    
    
   
    
    
    
    func getData()  {
        
        if let datax = try? Data(contentsOf: dataFilePath) {
            
            let decoder = PropertyListDecoder()
         
            
            do {
                
               
      
                
                
            let x =    try decoder.decode([UserInfo].self, from: datax)
                
                allUser = x
                
             
    
                
                
                
            }catch {
                print("error \(error)")
            }
            
            
        }
        
      

        
       
            
            
            
         
            
            
            
            
        
            
        }
        
        
    
    
    

    
    
    
    
    
    
}
    
    

    
    
