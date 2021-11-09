//
//  showAlertMessageView.swift
//  GasStation
//
//  Created by nebil on 11/7/21.
//

import UIKit

class showAlertMessageView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    public  func showMessage(myMessage:String)  {
         let alertContoller = UIAlertController(title: "Alert", message: myMessage, preferredStyle: .alert)
     let myAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
         print("button table from show message class")
     }
     
         alertContoller.addAction(myAction)
         
     
        self.present(alertContoller, animated: true, completion: nil)

     }

}
