//
//  gasStation.swift
//  GasStation
//
//  Created by nebil on 10/17/21.
//

import Foundation

class gasStation {
    var title:String
    var latitude:Double
    var longitude:Double
    var price :Int
    var imageName:String
    
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
    
    
}
