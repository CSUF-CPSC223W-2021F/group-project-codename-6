//
//  SignInViewController.swift
//  GasStation
//
//  Created by nebil on 11/7/21.
//

import UIKit

class SignInViewController: UIViewController {


        
        var allUser = [UserInfo]()
        
        var singUnUser : UserInfo?
        
        
        let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("Item.plist")
        
     
      
        
    
   
     
        
        @IBOutlet weak var passworldTextfield: UITextField!
        
     
        
        
        @IBOutlet weak var emailTextfield: UITextField!
     
 
 
 
        
        override func viewDidLoad() {
            super.viewDidLoad()

            print(dataFilePath)
            // Do any additional setup after loading the view.
        }
        
        @IBAction func signIn(_ sender: UIButton) {
            
            getData()
            for user in allUser {
                
                
             
                guard emailTextfield.text == user.getEmail() || passworldTextfield.text == user.getPassword() else {
              showMessage(myMessage: "your Email or password is wrong")
                    return
                }
                
                if emailTextfield.text == user.getEmail() && passworldTextfield.text == user.getPassword()  {
                   
                  //  showMessage(myMessage: "Welcome \(user.getName().uppercased())")
                    
                  singUnUser = user
                

                    print("welcome")
                    //print(user.getName())
                  //  print(user.getPassword())
                  
                    user.userInfo()
                    performSegue(withIdentifier: "mapViewiD", sender: self)
                }
                
            }
            
            
            
        }
        
     
        
     
      
        
        func getData()  {
            
            if let datax = try? Data(contentsOf: dataFilePath) {
                
                let decoder = PropertyListDecoder()
             
                
                do {
                    
                let getAllUserDataFromFile =    try decoder.decode([UserInfo].self, from: datax)
                
                    allUser = getAllUserDataFromFile
                    
                }catch {
                    print("error \(error)")
                }
                
                
            }
        
        
        
        }
        
        
        
        
        
        
        
    
        public  func showMessage(myMessage:String)  {
             let alertContoller = UIAlertController(title: "Alert", message: myMessage, preferredStyle: .alert)
         let myAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
         }
         
             alertContoller.addAction(myAction)
             
             present(alertContoller, animated: true, completion: nil)
             
             
             
         
         
         }
        
        
     
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let dest = segue.destination as? ViewController
       
         //   dest?.currentUser = singUnUser
        
        

        
        }
        

 
}
