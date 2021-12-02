//
//  RouteDirectionController.swift
//  GasStation
//
//  Created by csuftitan on 11/21/21.
//

import UIKit
import MapKit

class RouteDirectionController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    var currentRoute: MKRoute!
    override func viewDidLoad() {
        super.viewDidLoad()
        showRoutes()
    }
    
    func showRoutes(){
        var direction = currentRoute!.steps
        let miles = String(round(currentRoute.distance * 0.000621) / 100.0)
        let time = currentRoute!.expectedTravelTime
        textView.text = "\(direction[0].instructions)\n"
        direction.remove(at: 0)
        for step in direction {
            textView.text += "\(step.instructions)\n\n"
        }
        
        textView.text += "Distance: \(miles) miles\n"
        textView.text += "ETA: \(time/60) minutes\n"
        
    }
}
