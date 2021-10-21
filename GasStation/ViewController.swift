//
//  ViewController.swift
//  GasStation
//
//  Created by csuftitan on 9/19/21.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var fromStart: UITextField!
    
    @IBOutlet weak var fromTo: UITextField!
    
    @IBAction func fromTouch(_ sender: Any) {
        fromStart.text = gas1.address
    }
    
    @IBAction func toTouch(_ sender: Any) {
        fromTo.text = gas2.address
    }
    
    
}

