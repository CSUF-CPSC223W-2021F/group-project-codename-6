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
    @IBOutlet var saveButton: UIButton!
    
    var editUserInfo: UserInfo?
    
    
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
        
        performSegue(withIdentifier: "backToProfile", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editDest = segue.destination as! profile
        editDest.userInfo = editUserInfo
        
        if firstnameField.text == ""  {
            editDest.userInfo?.firstname = editUserInfo!.firstname
        } else {
        editUserInfo?.firstname = firstnameField.text!
        }
        if lastnameField.text == ""  {
            editDest.userInfo?.lastname = editUserInfo!.lastname
        } else {
        editUserInfo?.lastname = lastnameField.text!
        }
        if usernameField.text == ""  {
            editDest.userInfo?.username = editUserInfo!.username
        } else {
        editUserInfo?.username = usernameField.text!
        }
        if emailField.text == "" {
            editDest.userInfo?.email = editUserInfo!.email
        } else {
            editUserInfo?.email = emailField.text!
        }
        if phonenumberField.text == ""  {
            editDest.userInfo?.phonenumber = editUserInfo!.phonenumber
        } else {
            editUserInfo?.phonenumber = phonenumberField.text!
        }
        if homeaddressField.text == "" {
            editDest.userInfo?.homeaddress = editUserInfo!.homeaddress
        } else {
        editUserInfo?.homeaddress = homeaddressField.text!
        }
        if birthdateField.text == "" {
            editDest.userInfo?.birthdate = editUserInfo!.birthdate
        } else {
        editUserInfo?.birthdate = birthdateField.text!
        }
        
        editDest.firstnameLabel?.text = editUserInfo?.firstname
        editDest.lastnameLabel?.text = editUserInfo?.lastname
        editDest.usernameLabel?.text = editUserInfo?.username
        editDest.emailLabel?.text = editUserInfo?.email
        editDest.phonenumberLabel?.text = editUserInfo?.phonenumber
        editDest.homeaddressLabel?.text = editUserInfo?.homeaddress
        editDest.birthdateLabel?.text = editUserInfo?.birthdate
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstnameField.layer.cornerRadius = 22
        lastnameField.layer.cornerRadius = 22
        usernameField.layer.cornerRadius = 22
        emailField.layer.cornerRadius = 22
        phonenumberField.layer.cornerRadius = 22
        homeaddressField.layer.cornerRadius = 22
        birthdateField.layer.cornerRadius = 22
        
        saveButton.layer.cornerRadius = 22
        
        firstnameField.placeholder = editUserInfo?.firstname
        lastnameField.placeholder = editUserInfo?.lastname
        emailField.placeholder = editUserInfo?.email
        phonenumberField.placeholder = editUserInfo?.phonenumber
        homeaddressField.placeholder = editUserInfo?.homeaddress
        birthdateField.placeholder = editUserInfo?.birthdate
        usernameField.placeholder = editUserInfo?.username
        
    }
}
