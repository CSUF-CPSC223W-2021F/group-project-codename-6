//
//  gasStationData.swift
//  GasStation
//
//  Created by nebil on 10/17/21.
//

import Foundation

class GasStationData {
    
    var stationData : [gasStation]
    
    init() {
        
        stationData = [gasStation]()
        stationData.append(shell)
        stationData.append(arco)
        stationData.append(cosco)
       stationData.append(chevron)
        stationData.append(mobile)
        
        
    }
    var shell = gasStation(title: "shell", latitude: 33.876236, longitude: -117.933154, price: 8, imageName: "shell.png")

    var arco = gasStation(title: "arco", latitude: 33.874731, longitude: -117.934920, price: 3, imageName: "argo.jpg")
    var cosco = gasStation(title: "costco", latitude: 33.874856, longitude: -117.931862, price: 2, imageName: "costco.png")
    var chevron = gasStation(title: "chevron", latitude: 33.865640, longitude: -117.947448, price: 7,imageName: "chevron")
    
    var mobile = gasStation(title: "mobile", latitude:  33.882784, longitude: -117.886305, price: 1, imageName:"")
    

  
 
    
    
    func getDtationData() -> [gasStation] {
        
        return stationData
    }
    
    
    func cheapest() -> gasStation {
        
       
        var myMax = stationData[0].price
        var newI = 0
        for i in 0..<stationData.count {
            
            if stationData[i].price < myMax {
                
                myMax = stationData[i].price
                newI = i
            }
            
            
        }
        
        return stationData[newI]
        
        
    }
    
    

}
