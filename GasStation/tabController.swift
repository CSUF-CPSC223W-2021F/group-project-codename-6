//
//  tabController.swift
//  GasStation
//
//  Created by csuftitan on 12/2/21.
//

import UIKit

class tabController: UITabBarController {

    var currentUser: UserInfo?
    override func viewDidLoad() {
        super.viewDidLoad()
        let transferInfo = self.viewControllers![0] as! ViewController
        transferInfo.currentUsers = currentUser
        let transferProfile = self.viewControllers![2] as! profile
        transferProfile.userInfo = currentUser
        // Do any additional setup after loading the view.
    }
    
    
}

