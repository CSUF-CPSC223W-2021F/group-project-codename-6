//
//  ViewController.swift
//  GasStation
//
//  Created by csuftitan on 9/19/21.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet var firstnameLabel: UILabel!
    @IBOutlet var lastnameLabel: UILabel!
    @IBOutlet var phonenumberLabel: UILabel!
    @IBOutlet var homeaddressLabel: UILabel!
    @IBOutlet var birthdateLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    
    
    var myfirstName = String()
    var mylastName = String()
    var myphoneNumber = String()
    var myhomeAddress = String()
    var mybirthDate = String()
    var myEmail = String()
    var myuserName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstnameLabel.text = myfirstName
        lastnameLabel.text = mylastName
        phonenumberLabel.text = myphoneNumber
        homeaddressLabel.text = myhomeAddress
        birthdateLabel.text = mybirthDate
        emailLabel.text = myEmail
        usernameLabel.text = myuserName
        
        
        
    }
    
    @IBAction func editButton(_ sender: UIButton) {
        performSegue(withIdentifier: "segue", sender: self)
    }
}


