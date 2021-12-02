//
//  profileViewController.swift
//  GasStation
//
//  Created by csuftitan on 11/28/21.
//

import UIKit

class profileViewController: UIViewController {

        
    @IBOutlet var firstnameField: UITextField!
    @IBOutlet var lastnameField: UITextField!
    @IBOutlet var phonenumberField: UITextField!
    @IBOutlet var homeaddressField: UITextField!
    @IBOutlet var birthdateField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var usernameField: UITextField!
    
    
    @IBAction func saveButton(_ sender: Any) {
        guard firstnameField.text != nil else {
            return
        }
        guard lastnameField.text != nil else {
            return
        }
        guard phonenumberField.text != nil else {
            return
        }
        guard homeaddressField.text != nil else {
            return
        }
        guard birthdateField.text != nil else {
            return
        }
        guard emailField.text != nil else {
            return
        }
        guard usernameField.text != nil else {
            return
        }
        
        performSegue(withIdentifier: "segue2", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let firstController = segue.destination as! ViewController
        firstController.myfirstName = firstnameField.text!
        firstController.mylastName = lastnameField.text!
        firstController.myphoneNumber = phonenumberField.text!
        firstController.myhomeAddress = homeaddressField.text!
        firstController.mybirthDate = birthdateField.text!
        firstController.myEmail = emailField.text!
        firstController.myuserName = usernameField.text!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
