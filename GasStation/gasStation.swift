//
//  gasStation.swift
//  GasStation
//
//  Created by nebil on 10/17/21.
//

import Foundation

class gasStations: Codable {
    var title: String
    var latitude: Double
    var longitude: Double
    var price: Int
    var imageName: String
    
    init() {
        self.title = ""
        self.latitude = 0.0
        self.longitude = 0.0
        self.price = 0
        self.imageName = ""
    }
    
    init(title: String, latitude: Double, longitude: Double, price: Int, imageName: String) {
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
        self.price = price
        self.imageName = imageName
    }
    
    func getTitle() -> String {
        return self.title
    }

    func getlatitude() -> Double {
        return self.latitude
    }

    func getlongitude() -> Double {
        return self.longitude
    }

    func getPrice() -> Int {
        return self.price
    }
    
    func getImageName() -> String {
        return self.imageName
    }
    
    func setPrice(price: Int) {
        self.price = price
    }
    
    func settitle(title: String) {
        self.title = title
    }
    
    func setLatitude(latitude: Double) {
        self.latitude = latitude
    }

    func setlongitude(longitude: Double) {
        self.longitude = longitude
    }
 
    // var latitude:Double
    // var longitude:Double
}
