//
//  benmartinez.swift
//  GasStation
//
//  Created by csuftitan on 10/25/21.
//

import UIKit

class benmartinez: UIViewController {

    
    @IBOutlet weak var regulerPrice: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "changePricesegue" {
            let des = segue.destination as? ViewController
            des!.changeRegulerPrice = 10
        
        }
    }
    
    @IBAction func changePrice(_ sender: UIButton) {
        
        
    }
    
}
