//
//  benmartinez.swift
//  GasStation
//
//  Created by csuftitan on 10/25/21.
//

import MapKit
import UIKit

class benmartinez: UIViewController {
    @IBOutlet var regularPrice: UITextField!
    @IBOutlet var midPrice: UITextField!
    @IBOutlet var premiumPrice: UITextField!
    
    var currentWaypoint: MKAnnotationView!
    var allAnnotation = gasStationsData()
    var currentPrice:Float?
    var incomingAnnotation = ["Lat": 0.0, "Lon":0.0]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkList()

        // Do any additional setup after loading the view.
    }
    
    func checkList() {
        for station in allAnnotation.getDtationData() {
            if incomingAnnotation["Lat"] == station.latitude && incomingAnnotation["Lon"] == station.longitude {
                regularPrice.text = "\(station.price["Regular"]!)"
                midPrice.text = "\(station.price["Mid"]!)"
                premiumPrice.text = "\(station.price["Premium"]!)"
                
            }
        }
    }
    
    func changeDatabase() {
        for gasStation in allAnnotation.getDtationData() {
            let location = currentWaypoint.annotation?.coordinate
 
            if gasStation.getlatitude() == location?.latitude, gasStation.getlongitude() == location?.longitude {
                
                currentPrice = Float(regularPrice.text!)
                gasStation.price["Regular"] = currentPrice
                currentPrice = Float(midPrice.text!)
                gasStation.price["Mid"] = currentPrice
                currentPrice = Float(premiumPrice.text!)
                gasStation.price["Premium"] = currentPrice
                
                print("price is change")
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
        changeDatabase()
        des?.itemxxx = allAnnotation
        des?.addedAnnotation = true
    }
    
    @IBAction func changePrice(_ sender: UIButton) {}
}
