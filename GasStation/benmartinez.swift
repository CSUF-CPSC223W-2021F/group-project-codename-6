//
//  benmartinez.swift
//  GasStation
//
//  Created by csuftitan on 10/25/21.
//

import MapKit
import UIKit

class benmartinez: UIViewController {
    @IBOutlet var regulerPrice: UITextField!
    var currentWaypoint: MKAnnotationView!
    var allAnnotation = gasStationsData()
    var currentPrice:Float?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func changeDatabase() {
        for gasStation in allAnnotation.getDtationData() {
            let location = currentWaypoint.annotation?.coordinate
 
            if gasStation.getlatitude() == location?.latitude, gasStation.getlongitude() == location?.longitude {
                
                
                print("price is change")
                gasStation.price["Regular"] = currentPrice
                self.allAnnotation.saveGasStationData()
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let des = segue.destination as? ViewController
//            des!.changeRegulerPrice = 10
        let current:String = regulerPrice.text!
        currentPrice = Float(current)!
        changeDatabase()
        des?.itemxxx = allAnnotation
        des?.addedAnnotation = true
    }
    
    @IBAction func changePrice(_ sender: UIButton) {}
}
