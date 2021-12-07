//
//  tabController.swift
//  GasStation
//
//  Created by csuftitan on 12/2/21.
//

import UIKit

class tabController: UITabBarController,UITabBarControllerDelegate {

    var currentUser: UserInfo?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        let transferInfo = self.viewControllers![0] as! ViewController
        transferInfo.currentUsers = currentUser
        let transferProfile = self.viewControllers![2] as! profile
        transferProfile.userInfo = currentUser
        // Do any additional setup after loading the view.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let currentView = viewController.tabBarItem.title!
        print(currentView)
        if currentView == "Gas Station" {
            let mainView = self.viewControllers![0] as! ViewController
            let stationView = self.viewControllers![1] as! benmartinez
            
            stationView.incomingAnnotation = mainView.selectedAnnotation
            for x in mainView.itemxxx.getDtationData() {
                if mainView.selectedAnnotation["Lat"] == x.latitude && mainView.selectedAnnotation["Lon"] == x.longitude {
                    stationView.regularPrice.text = "\(x.price["Regular"]!)"
                    stationView.midPrice.text = "\(x.price["Mid"]!)"
                    stationView.premiumPrice.text = "\(x.price["Premium"]!)"
                }
            }
        }
    }
}

