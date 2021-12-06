//
//  ViewController.swift
//  GasStation
//
//  Created by csuftitan on 9/19/21.
//

import UIKit
import MapKit

class profile: UIViewController {
    
    @IBOutlet var firstnameLabel: UILabel!
    @IBOutlet var lastnameLabel: UILabel!
    @IBOutlet var phonenumberLabel: UILabel!
    @IBOutlet var homeaddressLabel: UILabel!
    @IBOutlet var birthdateLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var editButton: UIButton!

    var userInfo: UserInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editButton.layer.cornerRadius = 22
        
        firstnameLabel.text = userInfo?.firstname
        lastnameLabel.text = userInfo?.lastname
        phonenumberLabel.text = userInfo?.phonenumber
        homeaddressLabel.text = userInfo?.homeaddress
        birthdateLabel.text = userInfo?.birthdate
        emailLabel.text = userInfo?.email
        usernameLabel.text = userInfo?.username
    }
    
    @IBAction func editButton(_ sender: UIButton) {
        performSegue(withIdentifier: "Edit", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextDest = segue.destination as! profileViewController
        nextDest.editUserInfo = userInfo
    }
}


