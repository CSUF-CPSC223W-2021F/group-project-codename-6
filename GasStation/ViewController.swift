//
//  ViewController.swift
//  GasStation
//
//  Created by csuftitan on 9/19/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    private var myLocationManager = CLLocationManager()
    private var myCurrentLocation: CLLocationCoordinate2D?
    @IBOutlet weak var myMapview: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationService()
    }
    
    
    
    
    
    func locationService()  {
        myLocationManager.delegate = self
        
        
            myMapview.showsUserLocation = true
            myLocationManager.requestAlwaysAuthorization()
            myLocationManager.desiredAccuracy = kCLLocationAccuracyBest
            myLocationManager.startUpdatingLocation()

        }
        
        
        
        
   
        
        
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        if let updateLocation = locations.first?.coordinate {
            myCurrentLocation = updateLocation
        }
        
        print(myCurrentLocation?.latitude)
        print("my  longitude \(myCurrentLocation?.longitude)")
    }
   
    @IBAction func nearGasStation(_ sender: UIButton) {
    }
    
    @IBAction func cheapGasStation(_ sender: UIButton) {
    
    }
    
    
    @IBAction func zoomIn(_ sender: UIButton) {
        
        print("zoom in")
    }
    
    @IBAction func zoomOut(_ sender: UIButton) {
        print("zoom out")
    }
    
    
}

