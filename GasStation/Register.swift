//
//  Register.swift
//  GasStation
//
//  Created by nebil on 11/7/21.
//

import Foundation
import UIKit



class Register:  UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUp(_ sender: UIButton) {

        if nameTextField.text != "" && emailTextField.text != "" && passwordTextfield.text != "" {
          
          
            let signUpNewUser = AllUserData()

            let newUser = UserInfo(name: nameTextField.text!, email: emailTextField.text!, password: passwordTextfield.text!)
            signUpNewUser.addNewUser(user: newUser)
            
        }
        else {
            print("please fill up all Textfield")
        }
        
        
        
    }
    
    
    
    
    
    
    public  func showMessage(myMessage:String)  {
         let alertContoller = UIAlertController(title: "Alert", message: myMessage, preferredStyle: .alert)
     let myAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
         print("button table from show message class")
     }
     
         alertContoller.addAction(myAction)
         
         present(alertContoller, animated: true, completion: nil)
         
         
         
     
     
     }
    
    

}
