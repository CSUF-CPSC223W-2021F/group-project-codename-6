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
    var price: [String: Float] = ["Regular": 0.0, "Mid": 0.0, "Premium": 0.0]
    var imageName: String

    init() {
        self.title = ""
        self.latitude = 0.0
        self.longitude = 0.0
        self.imageName = ""
    }

    init(title: String, latitude: Double, longitude: Double, imageName: String) {
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
        self.imageName = imageName
        
        stationPrice()
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
    
    func stationPrice() {
        switch(title) {
        case "Chevron":
            self.price["Regular"] = 4.27
            self.price["Mid"] = 4.57
            self.price["Premium"] = 4.87
        case "Arco":
            self.price["Regular"] = 3.27
            self.price["Mid"] = 3.57
            self.price["Premium"] = 3.87
        case "Shell":
            self.price["Regular"] = 4.07
            self.price["Mid"] = 4.27
            self.price["Premium"] = 4.47
        case "Costco":
            self.price["Regular"] = 3.85
            self.price["Mid"] = 4.05
            self.price["Premium"] = 4.15
        case "76":
            self.price["Regular"] = 4.38
            self.price["Mid"] = 4.68
            self.price["Premium"] = 4.98
        case "Mobil":
            self.price["Regular"] = 3.85
            self.price["Mid"] = 4.15
            self.price["Premium"] = 4.45
        default:
        print("No gas station located")
        }
    }
    func getPrice(_ gasType: String) {
        stationPrice()
    }

    func getImageName() -> String {
        return self.imageName
    }

    func setPrice(_ gasType: String, price: Float) {
        self.price[gasType] = price
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
