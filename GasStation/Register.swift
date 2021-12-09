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
    
    @IBOutlet var lastnameField:UITextField!

    @IBOutlet var usernameField:UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet var phonenumberField: UITextField!
    
    @IBOutlet var addressField:UITextField!
    
    @IBOutlet var birthdateField:UITextField!
    
    @IBOutlet var register:UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.layer.cornerRadius = 22
        lastnameField.layer.cornerRadius = 22
        usernameField.layer.cornerRadius = 22
        emailTextField.layer.cornerRadius = 22
        passwordTextfield.layer.cornerRadius = 22
        phonenumberField.layer.cornerRadius = 22
        addressField.layer.cornerRadius = 22
        birthdateField.layer.cornerRadius = 22
        
        register.layer.cornerRadius = 22

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUp(_ sender: UIButton) {

        if nameTextField.text != "" && lastnameField.text != "" && usernameField.text != "" && emailTextField.text != "" && passwordTextfield.text != "" && phonenumberField.text != "" && addressField.text != "" && birthdateField.text != "" {
          
          
            let signUpNewUser = AllUserData()

            let newUser = UserInfo(firstname: nameTextField.text!, lastname: lastnameField.text!, username: usernameField.text!, email: emailTextField.text!, password: passwordTextfield.text!, phonenumber: phonenumberField.text!, address: addressField.text!, birthdate: birthdateField.text!)
            signUpNewUser.addNewUser(user: newUser)
           
            if signUpNewUser.succefulRegister {
            
            showMessage(myMessage: "Welcome \(nameTextField.text!), You have succefully registered to the GasStation App")
            }
            else {
                
                
                showMessage(myMessage: "This user already exists, please use a different email")
            }
            
        }
        else {
            showMessage(myMessage: "please fill all text fields")
            
            print("please fill all text fields")
        }
        
    }
    
    
    
    
    
    
    public  func showMessage(myMessage:String)  {
         let alertContoller = UIAlertController(title: "GasStation", message: myMessage, preferredStyle: .alert)
     let myAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
         print("button table from show message class")
     }
     
         alertContoller.addAction(myAction)
         
         present(alertContoller, animated: true, completion: nil)
         
         
         
     
     
     }
    
    

}
