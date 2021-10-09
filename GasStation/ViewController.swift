//
//  ViewController.swift
//  GasStation
//
//  Created by csuftitan on 9/19/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    var zoomDistance1:Double = 7000
    var zoomDistance2:Double = 7000
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
        
        
        
        
    func zoomToCurrentLocation(coordinate : CLLocationCoordinate2D,  distance2:Double , distance1 : Double)  {
        
        
        let currentRegine =  MKCoordinateRegion(center: coordinate, latitudinalMeters: distance1, longitudinalMeters: distance2)
        myMapview.setRegion(currentRegine, animated: true)
        
        
    }
        
        
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        if let updateLocation = locations.first?.coordinate {
            myCurrentLocation = updateLocation
          zoomToCurrentLocation(coordinate: updateLocation, distance2: zoomDistance1, distance1: zoomDistance2)
        }
        
        
        
        
        
    }
   
    @IBAction func nearGasStation(_ sender: UIButton) {
    }
    
    @IBAction func cheapGasStation(_ sender: UIButton) {
    
    }
    
    
    @IBAction func zoomIn(_ sender: UIButton) {
        
        if let updateLocation = myCurrentLocation{
        
      zoomDistance2 = zoomDistance2 - 500
      zoomDistance1 = zoomDistance1 - 500
        
        
      zoomToCurrentLocation(coordinate: updateLocation, distance2: zoomDistance2, distance1: zoomDistance1)
   
        }
        }
    
    @IBAction func zoomOut(_ sender: UIButton) {
        if let updateLocation = myCurrentLocation{
        
      zoomDistance2 = zoomDistance2 + 500
      zoomDistance1 = zoomDistance1 + 500
        
        
      zoomToCurrentLocation(coordinate: updateLocation, distance2: zoomDistance2, distance1: zoomDistance1)
   
        }
    }
    
    
}

