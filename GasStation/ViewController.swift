//
//  ViewController.swift
//  GasStation
//
//  Created by csuftitan on 9/19/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var zoomDistance1:Double = 7000
    var zoomDistance2:Double = 7000
    private var myLocationManager = CLLocationManager()
    private var myCurrentLocation: CLLocationCoordinate2D?
    @IBOutlet weak var myMapview: MKMapView!
    private var destinations : [MKPointAnnotation]  = []
    private var currentRoute: MKRoute?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationService()
        addAnnotation()
    }
    
    
    
    
    
    func locationService()  {
        myLocationManager.delegate = self
        myMapview.delegate = self
        
        
            myMapview.showsUserLocation = true
            myLocationManager.requestAlwaysAuthorization()
            myLocationManager.desiredAccuracy = kCLLocationAccuracyBest
            myLocationManager.startUpdatingLocation()

        }
        
        
        
        
    func zoomToCurrentLocation(coordinate : CLLocationCoordinate2D,  distance2:Double , distance1 : Double)  {
        
        
        let currentRegine =  MKCoordinateRegion(center: coordinate, latitudinalMeters: distance1, longitudinalMeters: distance2)
        myMapview.setRegion(currentRegine, animated: true)
        
        
    }
        
    func addAnnotation()  {
        let itemss = gasStationsData().getDtationData()

   
        var nebil = [MKPointAnnotation]()
        
        
        for i in 0..<itemss.count {
           
        let gasStationnn = MKPointAnnotation()
            gasStationnn.title = itemss[i].getTitle()
            gasStationnn.coordinate = CLLocationCoordinate2D(latitude: itemss[i].getlatitude(), longitude: itemss[i].getlongitude())
            gasStationnn.subtitle =  " PRICE : \(itemss[i].price)$".uppercased()
            nebil.append(gasStationnn)
        
            
          
        }

     
        myMapview.showAnnotations(nebil, animated: true)
        myMapview.addAnnotations(nebil)
     
        
       
        
    }
        
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        if let updateLocation = locations.first?.coordinate {
            myCurrentLocation = updateLocation
          zoomToCurrentLocation(coordinate: updateLocation, distance2: zoomDistance1, distance1: zoomDistance2)
            
            
            //construcRoute(userlocation: updateLocation, gasStation: <#gasStation#>)

        }
        
        
        
        
        
    }
   
    @IBAction func nearGasStation(_ sender: UIButton) {
    }
    
    @IBAction func cheapGasStation(_ sender: UIButton) {
    
        let cheapestGasStation = gasStationsData()

        
        construcRoute(userlocation: myCurrentLocation!, gasStation: cheapestGasStation.cheapest())

        
        
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
    
    
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        print(view.annotation?.title!)
        
        
        
        if let price = view.annotation?.subtitle, let title  = view.annotation?.title {
       
        
            var alert = UIAlertController(title: "", message: " price \(price!) and name is \(title!)".uppercased() , preferredStyle: .alert)
        
        
        
          alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        
    
        
        self.present(alert, animated: true, completion: nil)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // to show annotation image
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
        
        if annotationView == nil {
            
           
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
            
        }
        
        
        if let title = annotation.title, title == "arco" {
            
            annotationView?.image = UIImage(named: "argo.jpg")
        }
        
        
        if let title = annotation.title, title == "shell" {
            
            annotationView?.image = UIImage(named: "shell.png")
        }
        
        if let title = annotation.title, title == "costco" {
            
            annotationView?.image = UIImage(named: "costco.png")
        
            
        }
        
        
        annotationView?.canShowCallout = true
        return nil
        
    }
    
    
    
    
   
    
    func construcRoute(userlocation:CLLocationCoordinate2D, gasStation:gasStations)  {
        
        
        let gastationArray = gasStationsData().getDtationData()
        let nebil = CLLocationCoordinate2D(latitude: gasStation.getlatitude(), longitude: gasStation.getlongitude())
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: userlocation))
        directionRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: nebil))
        
        directionRequest.requestsAlternateRoutes = true
        directionRequest.transportType = .automobile
        
        let direction = MKDirections(request: directionRequest)
        
        direction.calculate {[weak self] (directionResponce, error) in
            
            guard let strongSelf = self else { return}
        
            if let error = error {
                print(error.localizedDescription)
            }
            else if let responce = directionResponce, (responce.routes.count > 0) {
                
                strongSelf.currentRoute = responce.routes[0]
                strongSelf.myMapview.addOverlay(responce.routes[0].polyline)
                strongSelf.myMapview.setVisibleMapRect(responce.routes[0].polyline.boundingMapRect, animated: true)
                
            }
                
        
        
        }
        
   
    }
    
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let currentRoute = currentRoute else {
            
            return MKOverlayRenderer()
        }
        
        let polyLineRenderer = MKPolylineRenderer(overlay: currentRoute.polyline)
        polyLineRenderer.strokeColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        polyLineRenderer.lineWidth = 8
    return polyLineRenderer
    }
    
    
    
    
    
}

