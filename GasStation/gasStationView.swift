//
//  benmartinez.swift
//  GasStation
//
//  Created by csuftitan on 10/25/21.
//

import MapKit
import UIKit

class gasStationView: UIViewController {
    @IBOutlet var regularPrice: UITextField!
    @IBOutlet var midPrice: UITextField!
    @IBOutlet var premiumPrice: UITextField!
    
    @IBOutlet weak var gasStationImage: UIImageView!
    var currentWaypoint: MKAnnotationView!
    var allAnnotation = gasStationsData()
    var currentPrice: Float?
    var incomingAnnotation = ["Lat": 0.0, "Lon": 0.0]
    override func viewDidLoad() {
        super.viewDidLoad()
        gasStationImage.image = UIImage(named: "gasStation")
        checkList()

        // Do any additional setup after loading the view.
    }
    
    func checkList() {
        for station in allAnnotation.getDtationData() {
            if incomingAnnotation["Lat"] == station.latitude, incomingAnnotation["Lon"] == station.longitude {
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
            }
        }
        allAnnotation.saveGasStationData()
    }
    
    //Pass back to mapView our data changes
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let des = segue.destination as? mapView
        changeDatabase()
        des?.gasStationDataClass = allAnnotation
    }
    
    @IBAction func changePrice(_ sender: UIButton) {}
}
