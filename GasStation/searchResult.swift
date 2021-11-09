//
//  searchResult.swift
//  GasStation
//
//  Created by csuftitan on 11/8/21.
//

import Foundation
import MapKit

struct searchResult {
    var placeStation = [MKPointAnnotation]()
    
    mutating func addtoList(_ new: MKMapItem) {
        let newStation = MKPointAnnotation()
        newStation.title = new.name
        newStation.coordinate = new.placemark.coordinate
        newStation.subtitle = "1"
        
        placeStation.append(newStation)
    }
}
