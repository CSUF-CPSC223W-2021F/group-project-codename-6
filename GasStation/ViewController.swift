//
//  ViewController.swift
//  GasStation
//
//  Created by csuftitan on 9/19/21.
//

import MapKit
import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UISearchBarDelegate {
    var currentUser: UserInfo?
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
    @IBOutlet weak var routeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentName = currentUser?.getName() {
            userLabel.text = "Welcome \(currentName)"
        }
      
        // Do any additional setup after loading the view.
        searchbar.delegate = self
        searchbar.showsSearchResultsButton = true
        locationService()
        addAnnotation()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "routeName" {
            let newVC: RouteDirectionController = segue.destination as! RouteDirectionController
            newVC.currentRoute = routeDirection
        }

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchBar.text
        
        let direction = Direction()
        direction.search(request,self)
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
        
    func addAnnotation() {
        let itemss = gasStationsData().getDtationData()

        var nebil = [MKPointAnnotation]()
        
        for i in 0 ..< itemss.count {
            let gasStationnn = MKPointAnnotation()
            gasStationnn.title = itemss[i].getTitle()
            gasStationnn.coordinate = CLLocationCoordinate2D(latitude: itemss[i].getlatitude(), longitude: itemss[i].getlongitude())
            gasStationnn.subtitle = " PRICE : \(itemss[i].price)$".uppercased()
            nebil.append(gasStationnn)
        }
        myMapview.showAnnotations(nebil, animated: true)
        myMapview.addAnnotations(nebil)
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
            }
            else if min > distance {
                min = distance
                nearestGas = x
            }
        }
        construcRoute(userlocation: myCurrentLocation!, gasStation: nearestGas!)
        routeButton.isHidden = false
    }
        
    @IBAction func cheapGasStation(_ sender: UIButton) {
        let cheapestGasStation = gasStationsData()

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
        print(view.annotation?.title!)
        
        if let price = view.annotation?.subtitle, let title = view.annotation?.title {
            var alert = UIAlertController(title: "", message: " price \(price) and name is \(title!)".uppercased(), preferredStyle: .alert)
        
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        
            present(alert, animated: true, completion: nil)
        }
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
        directionRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: userlocation))
        directionRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: nebil))
        
        directionRequest.requestsAlternateRoutes = true
        directionRequest.transportType = .automobile
        
        let direction = MKDirections(request: directionRequest)
        
        direction.calculate { [weak self] directionResponce, error in
            
            guard let strongSelf = self else { return }
        
            if let error = error {
                print(error.localizedDescription)
            }
            else if let responce = directionResponce, responce.routes.count > 0 {
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
