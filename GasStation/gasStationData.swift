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
      //  stationData.append(chevron)
        
        
    }
    var shell = gasStation(title: "shell", latitude: 33.876236, longitude: -117.933154, price: 3)

    var arco = gasStation(title: "arco", latitude: 33.874731, longitude: -117.934920, price: 4)
    var cosco = gasStation(title: "cosco", latitude: 33.874856, longitude: -117.931862, price: 2)
    var chevron = gasStation(title: "chevron", latitude: 33.865640, longitude: -117.947448, price: 4)
    
    
    
    func getDtationData() -> [gasStation] {
        
        return stationData
    }
    
    
    
    
    
}
