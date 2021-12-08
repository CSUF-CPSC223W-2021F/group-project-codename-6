//
//  direction.swift
//  GasStation
//
//  Created by csuftitan on 9/23/21.
//  Anthony Ngon

import Foundation
import MapKit

struct Direction {
    var valid: Bool = true
    var street_address: String = ""

//    func checkStreetAddress() -> String {
//        return street_address
//    }
//
    func checkValid(_ searchingFor: String?) -> Bool {
        let validGasStation = ["Arco","Mobil","Shell","Chevron","Costco","76"]
        if validGasStation.contains(searchingFor!) {
            
            return true
        }
        return false
    }
//
//    func checkPossibleGasStation() -> [String] {
//        return possibleGasStation
//    }
    
    func search(_ parameter: String,_ view: ViewController) {
        if !checkValid(parameter) {
            return
        }
        view.addAnnotation(nameOFGasstation: parameter)
    }
    
    //Code origin https://rosettacode.org/wiki/Haversine_formula#Swift
    func nearest(lat1: Double, lon1:Double, lat2: Double, lon2:Double) -> Double {
        let lat1rad = lat1 * Double.pi/180
        let lon1rad = lon1 * Double.pi/180
        let lat2rad = lat2 * Double.pi/180
        let lon2rad = lon2 * Double.pi/180
     
        let dLat = lat2rad - lat1rad
        let dLon = lon2rad - lon1rad
        let a = sin(dLat/2) * sin(dLat/2) + sin(dLon/2) * sin(dLon/2) * cos(lat1rad) * cos(lat2rad)
        let c = 2 * asin(sqrt(a))
        let R = 6372.8
     
        return R * c
    }
}
