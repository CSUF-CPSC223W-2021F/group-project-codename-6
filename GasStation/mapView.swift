//
//  ViewController.swift
//  GasStation
//
//  Created by csuftitan on 9/19/21.
//
import MapKit
import UIKit

class mapView: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UISearchBarDelegate {
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
    var currentMarker: MKAnnotationView?
    var selectedAnnotation = ["Lat": 0.0, "Lon": 0.0]
    var annotationArray = [MKPointAnnotation]()
    var gasStationDataClass = gasStationsData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentName = currentUsers?.getUsername() {
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
//        addAnnotation(nameOFGasstation: "Costco")
//        addAnnotation(nameOFGasstation: "Arco")
        // itemxxx.saveGasStationData()
//        gasStationDataClass.getGasStationData()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "routeName" {
            let newVC: RouteDirectionController = segue.destination as! RouteDirectionController
            newVC.currentRoute = routeDirection
        } else if segue.identifier == "userProfile" {
            let direction = segue.destination as! profileMainView
            direction.userInfo = currentUsers!
        } else if segue.identifier == "benSegue" {
            let direction = segue.destination as! gasStationView
            direction.currentWaypoint = currentMarker
            direction.allAnnotation = gasStationDataClass
            direction.incomingAnnotation = selectedAnnotation
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
        var stored = [MKPointAnnotation]()
       
        let direction = Direction()
        direction.search(searchBar.text!, self)
    }
    
    @IBAction func unwinds(_ seg: UIStoryboardSegue) {
        print("Unwind")
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
    
    func addAnnotation(nameOFGasstation: String) {
        // itemxxx.getGasStationData()
        let university = CLLocationCoordinate2D(latitude: 33.881074, longitude: -117.884964)
        let currentRegine = MKCoordinateRegion(center: university, latitudinalMeters: zoomDistance1, longitudinalMeters: zoomDistance2)
        
        let gasStationnn = MKPointAnnotation()
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = nameOFGasstation
        request.region = currentRegine
        let search = MKLocalSearch(request: request)
        
        
        if gasStationDataClass.getDtationData().contains(where: { $0.title == nameOFGasstation }) {
            for i in 0 ..< gasStationDataClass.getDtationData().count {
                let annotationOfGasStation = MKPointAnnotation()
                
                if gasStationDataClass.getDtationData()[i].getTitle() == nameOFGasstation {
                    annotationOfGasStation.title = gasStationDataClass.getDtationData()[i].getTitle()
                    annotationOfGasStation.subtitle = "\(gasStationDataClass.getDtationData()[i].getPrice("Regular"))"
                    annotationOfGasStation.coordinate = CLLocationCoordinate2D(latitude: gasStationDataClass.getDtationData()[i].getlatitude(), longitude: gasStationDataClass.getDtationData()[i].getlongitude())
                    
                    annotationArray.append(annotationOfGasStation)
                }

            }

            myMapview.addAnnotations(annotationArray)
            myMapview.showAnnotations(annotationArray, animated: true)
            return
        }
        
        
        search.start { [self] response, _ in
            
            if let response = response {
                for location in response.mapItems {
                    let gasStationObject = gasStations()
                    
                    let coordinatexx = location.placemark.coordinate
                   
                    gasStationObject.title = nameOFGasstation
                    gasStationObject.setlongitude(longitude: coordinatexx.longitude)
                    gasStationObject.setLatitude(latitude: coordinatexx.latitude)
                    self.gasStationDataClass.AddGasstationToData(newGasStation: gasStationObject)
                }
            }
            
            for i in 0 ..< gasStationDataClass.getDtationData().count {
                let annotationOfGasStation = MKPointAnnotation()

                annotationOfGasStation.title = gasStationDataClass.getDtationData()[i].getTitle()
                annotationOfGasStation.subtitle = "\(gasStationDataClass.getDtationData()[i].getPrice("Regular"))"
                annotationOfGasStation.coordinate = CLLocationCoordinate2D(latitude: gasStationDataClass.getDtationData()[i].getlatitude(), longitude: gasStationDataClass.getDtationData()[i].getlongitude())
                
                annotationArray.append(annotationOfGasStation)
            }

            myMapview.addAnnotations(annotationArray)
            myMapview.showAnnotations(annotationArray, animated: true)
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
        let proxmity = gasStationDataClass.getDtationData()
        let directiontoNearest = Direction()
        var min: Double = 0.0000
        var nearestGas: gasStations?
        
        for x in proxmity {
            let distance: Double = directiontoNearest.nearest(lat1: myCurrentLocation!.latitude, lon1: myCurrentLocation!.longitude, lat2: x.latitude, lon2: x.longitude)
            
            if min == 0.0 {
                min = distance
                nearestGas = x
            } else if min > distance {
                min = distance
                nearestGas = x
            }
        }
        construcRoute(userlocation: myCurrentLocation!, gasStation: nearestGas!)
        routeButton.isHidden = false
    }
        
    @IBAction func cheapGasStation(_ sender: UIButton) {
        let cheapestGasStation = gasStationDataClass
        cheapestGasStation.getGasStationData()

        construcRoute(userlocation: myCurrentLocation!, gasStation: cheapestGasStation.cheapest())
        routeButton.isHidden = false
    }
 
    var changeRegulerPrice: Int?
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        currentMarker = view
        selectedAnnotation["Lat"] = currentMarker?.annotation?.coordinate.latitude
        selectedAnnotation["Lon"] = currentMarker?.annotation?.coordinate.longitude
        
        performSegue(withIdentifier: "benSegue", sender: self)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // to show annotation image
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
        }
        
        if let title = annotation.title, title == "Arco" {
            annotationView?.image = UIImage(named: "arco.png")
            return annotationView
        } else if let title = annotation.title, title == "Shell" {
            annotationView?.image = UIImage(named: "shell.png")
            return annotationView
        } else if let title = annotation.title, title == "Costco" {
            annotationView?.image = UIImage(named: "costco.png")
            return annotationView
        } else if let title = annotation.title, title == "Mobil" {
            annotationView?.image = UIImage(named: "mobil.png")
            return annotationView
        } else if let title = annotation.title, title == "76" {
            annotationView?.image = UIImage(named: "76.png")
            return annotationView
        } else if let title = annotation.title, title == "Chevron" {
            annotationView?.image = UIImage(named: "chevron.png")
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
                if strongSelf.myMapview.overlays.count > 0 {
                    for route in strongSelf.myMapview.overlays {
                        strongSelf.myMapview.removeOverlay(route)
                    }
                }
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
    
    /*
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
      
     */
}
