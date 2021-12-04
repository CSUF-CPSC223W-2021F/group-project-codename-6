//
//  ViewController.swift
//  GasStation
//
//  Created by csuftitan on 9/19/21.
//

import MapKit
import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UISearchBarDelegate {
    var currentUsers: UserInfo?
    @IBOutlet var userLabel: UILabel!
    var zoomDistance1: Double = 7000
    var zoomDistance2: Double = 7000
    private var myLocationManager = CLLocationManager()
    private var myCurrentLocation: CLLocationCoordinate2D?
    @IBOutlet var myMapview: MKMapView!
    private var destinations: [MKPointAnnotation] = []
    private var currentRoute: MKRoute?
    public var newData = searchResult()
    public var routeDirection: MKRoute!
    @IBOutlet var searchbar: UISearchBar!
    @IBOutlet var routeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentName = currentUsers?.getName() {
            userLabel.text = "Welcome \(currentName)"
        }
        
        // Do any additional setup after loading the view.
        searchbar.delegate = self
        searchbar.showsSearchResultsButton = true
        // addAnnotation(nameOFGasstation: "Argo")
        locationService()
        // addAnnotation(nameOFGasstation: "Mobile")
        // addAnnotation(nameOFGasstation: "Shell")
        // addAnnotation(nameOFGasstation: "Chevron")
      
        addAnnotation(nameOFGasstation: "Costco")
        addAnnotation(nameOFGasstation: "Arco")
        addAnnotation(nameOFGasstation: "Mobile")
       
        itemxxx.saveGasStationData()
        itemxxx.getGasStationData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "routeName" {
            let newVC: RouteDirectionController = segue.destination as! RouteDirectionController
            newVC.currentRoute = routeDirection
        } else if segue.identifier == "userProfile" {
            let direction = segue.destination as! profile
            direction.userInfo = self.currentUsers!
        
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
        var stored = [MKPointAnnotation]()
       
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchBar.text!
        
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            if let response = response {
                print(response.mapItems[0].name)
                for location in response.mapItems {
                    self.myMapview.addAnnotation(location.placemark)
                }
            }
        }
        
        let direction = Direction()
        direction.search(request, self)
    }

    func locationService() {
        myLocationManager.delegate = self
        myMapview.delegate = self
        
        myMapview.showsUserLocation = true
        myLocationManager.requestAlwaysAuthorization()
        myLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        myLocationManager.startUpdatingLocation()
    }
        
    func zoomToCurrentLocation(coordinate: CLLocationCoordinate2D, distance2: Double, distance1: Double) {
        let currentRegine = MKCoordinateRegion(center: coordinate, latitudinalMeters: distance1, longitudinalMeters: distance2)
        myMapview.setRegion(currentRegine, animated: true)
    }
    
    var nebil = [MKPointAnnotation]()
    var itemxxx = gasStationsData()
    
    func addAnnotation(nameOFGasstation: String) {
        itemxxx.getGasStationData()

        let gasStationnn = MKPointAnnotation()
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = nameOFGasstation
        let search = MKLocalSearch(request: request)
        search.start { [self] response, _ in

            if let response = response {
                for location in response.mapItems {
                    let gasStationxb = gasStations()

                    let coordinatexx = location.placemark.coordinate
               
                    gasStationxb.title = nameOFGasstation
                    gasStationxb.setlongitude(longitude: coordinatexx.longitude)
                    gasStationxb.setLatitude(latitude: coordinatexx.latitude)
                
                    self.itemxxx.AddGasstationToData(newGasStation: gasStationxb)
                }
            }
            for i in 0 ..< itemxxx.getDtationData().count {
                let gasGokdemir = MKPointAnnotation()

                gasGokdemir.subtitle = "\(itemxxx.getDtationData()[i].getPrice())"
                gasGokdemir.title = itemxxx.getDtationData()[i].getTitle()
                gasGokdemir.coordinate = CLLocationCoordinate2D(latitude: itemxxx.getDtationData()[i].getlatitude(), longitude: itemxxx.getDtationData()[i].getlongitude())
                
                nebil.append(gasGokdemir)
            }

            myMapview.addAnnotations(nebil)
            myMapview.showAnnotations(nebil, animated: true)
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let updateLocation = locations.first?.coordinate {
            myCurrentLocation = updateLocation
            zoomToCurrentLocation(coordinate: updateLocation, distance2: zoomDistance1, distance1: zoomDistance2)
            
            // construcRoute(userlocation: updateLocation, gasStation: <#gasStation#>)
        }
    }
   
    @IBAction func nearGasStation(_ sender: UIButton) {
        let proxmity = gasStationsData()
        let directiontoNearest = Direction()
        var min: Double = 0.0000
        var nearestGas: gasStations?
        
        for x in proxmity.stationData {
            let distance: Double = directiontoNearest.nearest(lat1: myCurrentLocation!.latitude, lon1: myCurrentLocation!.longitude, lat2: x.latitude, lon2: x.longitude)
            
            if min == 0.0 {
                min = distance
            } else if min > distance {
                min = distance
                nearestGas = x
            }
        }
        construcRoute(userlocation: myCurrentLocation!, gasStation: nearestGas!)
        routeButton.isHidden = false
    }
        
    @IBAction func cheapGasStation(_ sender: UIButton) {
        let cheapestGasStation = gasStationsData()
        
        itemxxx.saveGasStationData()
        itemxxx.getGasStationData()

        construcRoute(userlocation: myCurrentLocation!, gasStation: cheapestGasStation.cheapest())
        routeButton.isHidden = false
    }
    
    @IBAction func zoomIn(_ sender: UIButton) {
        if let updateLocation = myCurrentLocation {
            zoomDistance2 = zoomDistance2 - 500
            zoomDistance1 = zoomDistance1 - 500
            
            zoomToCurrentLocation(coordinate: updateLocation, distance2: zoomDistance2, distance1: zoomDistance1)
        }
    }
    
    @IBAction func zoomOut(_ sender: UIButton) {
        if let updateLocation = myCurrentLocation {
            zoomDistance2 = zoomDistance2 + 500
            zoomDistance1 = zoomDistance1 + 500
            
            zoomToCurrentLocation(coordinate: updateLocation, distance2: zoomDistance2, distance1: zoomDistance1)
        }
    }
    
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
           
           var newPrice = 0
           for gasStation in itemxxx.getDtationData() {
               
               let location = view.annotation?.coordinate
              
               
            
               
              
               
               
               if gasStation.getlatitude() == location?.latitude && gasStation.getlongitude() == location?.longitude {
                   
                  
         
               
                   gasStation.setPrice(price: -8999999001)
                   
                   newPrice = gasStation.getPrice()
                   
                   
                  // gasStation.settitle(title: "neden ben")
                   
                   itemxxx.saveGasStationData()
                //   itemxxx.getGasStationData()
                   
                   //myMapview.addAnnotations(nebil)
               
                 // myMapview.showAnnotations(nebil, animated: true)
                var path =    itemxxx.dataFilePath
               print(path)
               }
               
               
             
               
       }
          
           
           
           
           
           
           print(view.annotation?.title!)
           
           if let price = view.annotation?.subtitle, let title  = view.annotation?.title {
               print(price)
               
               view.annotation?.coordinate
               
    var myTextField = UITextField()
              
            var alert = UIAlertController(title: "", message: " Current Price \(newPrice)".uppercased() , preferredStyle: .alert)
           
             //  alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
            
            
            let action = UIAlertAction(title: "yes", style: .default) { (alertAction) in
                
                
                
                print(myTextField.text!)
            }
            
         
            
            
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
                   //cancel code
               }
            
           
            
            alert.addTextField { (textField) -> Void in
                textField.textColor = UIColor.blue
                textField.placeholder = "Type Price"
               
                myTextField = textField
                
            
            }
            
            alert.addAction(action)
            alert.addAction(cancelAction)
           

               present(alert, animated: true, completion: nil)
           }
           
           
           
         
           
           //self.myMapview.reloadInputViews()
           
       }
       
       
       
       

    
    
  
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // to show annotation image
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
        }
        
        if let title = annotation.title, title == "ARCO" {
            annotationView?.image = UIImage(named: "arco.png")
            return annotationView
        } else if let title = annotation.title, title == "Shell" {
            annotationView?.image = UIImage(named: "shell.png")
            return annotationView
        } else if let title = annotation.title, title == "Costco" {
            annotationView?.image = UIImage(named: "costco.png")
            return annotationView
        }
        
        annotationView?.canShowCallout = true
        return nil
    }
    
    func construcRoute(userlocation: CLLocationCoordinate2D, gasStation: gasStations) {
        
        
        let gastationArray = gasStationsData().getDtationData()
        let nebil = CLLocationCoordinate2D(latitude: gasStation.getlatitude(), longitude: gasStation.getlongitude())
        
        let directionRequest = MKDirections.Request()
        
        //
        
      //  directionRequest.requestsAlternateRoutes = false
        //
        directionRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: userlocation))
        directionRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: nebil))
        
        directionRequest.requestsAlternateRoutes = true
        directionRequest.transportType = .automobile
        
        let direction = MKDirections(request: directionRequest)
        
        direction.calculate { [weak self] directionResponce, error in
            
            guard let strongSelf = self else { return }
        
            if let error = error {
                print(error.localizedDescription)
            } else if let responce = directionResponce, responce.routes.count > 0 {
                strongSelf.currentRoute = responce.routes[0]
                strongSelf.myMapview.addOverlay(responce.routes[0].polyline)
                strongSelf.myMapview.setVisibleMapRect(responce.routes[0].polyline.boundingMapRect, animated: true)
            }
            self?.routeDirection = directionResponce!.routes[0]
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let currentRoute = currentRoute else {
            return MKOverlayRenderer()
        }
        
        let polyLineRenderer = MKPolylineRenderer(overlay: currentRoute.polyline)
        polyLineRenderer.strokeColor = #colorLiteral(red: 0.007509642746, green: 0.4820441008, blue: 0.9983070493, alpha: 1)
        polyLineRenderer.lineWidth = 8
        return polyLineRenderer
    }
}
