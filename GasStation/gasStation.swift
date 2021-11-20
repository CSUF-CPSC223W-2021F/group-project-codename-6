//
//  gasStation.swift
//  GasStation
//
//  Created by nebil on 10/17/21.
//

import Foundation

class gasStations {
    var title:String
    var latitude:Double
    var longitude:Double
    var price :Int
    var imageName:String
    
    init() {
        title = ""
        latitude = 0.0
        longitude = 0.0
        price = 0
        imageName = ""
    
    }
    
    init(title :String ,latitude :Double, longitude:Double, price :Int, imageName:String) {
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
        
        return imageName
    }
    
    
    func setPrice(price:Int)  {
        
        self.price = price
    }
    
    func settitle(title:String)  {
        
        self.title = title
    }
    
    
    
    
    func setLatitude(latitude:Double)  {
        self.latitude = latitude
    }
    func setlongitude(longitude:Double)  {
        
        self.longitude =  longitude
    }
 
   // var latitude:Double
   // var longitude:Double
    
    
}
