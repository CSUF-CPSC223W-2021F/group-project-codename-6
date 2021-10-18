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
        
        
    }
    var shell = gasStation(title: "shell", latitude: 33.876236, longitude: -117.933154, price: 8, imageName: "shell.png")

    var arco = gasStation(title: "arco", latitude: 33.874731, longitude: -117.934920, price: 4, imageName: "argo.jpg")
    var cosco = gasStation(title: "costco", latitude: 33.874856, longitude: -117.931862, price: 2, imageName: "costco.png")
    var chevron = gasStation(title: "chevron", latitude: 33.865640, longitude: -117.947448, price: 1,imageName: "chevron")
    
    
    
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
