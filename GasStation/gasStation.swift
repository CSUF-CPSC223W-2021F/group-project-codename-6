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
    
    init(title :String ,latitude :Double, longitude:Double, price :Int) {
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
        self.price = price
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

    
}
