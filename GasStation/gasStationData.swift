//
//  gasStationsData.swift
//  gasStations
//
//  Created by nebil on 10/17/21.
//

import Foundation

class gasStationsData {
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("Item2.plist")
   
    var stationData = [gasStations]()
    
    init() {
        //  stationData = [gasStations]()
        // saveGasStationData()
//        getGasStationData()
        
        do {
            try FileManager.default.removeItem(at: dataFilePath)
            
        } catch {
            print("file doesnt exist")
        }
    }
    
    func getDtationData() -> [gasStations] {
        return stationData
    }
    
    func AddGasstationToData(newGasStation: gasStations) {
        stationData.append(newGasStation)
    }
    
    func printNumberOFGasStation() -> Int {
        return stationData.count
    }
    
    func cheapest() -> gasStations {
        var myMax = stationData[0].price
        var newI = 0
        for i in 0 ..< stationData.count {
            if stationData[i].price < myMax {
                myMax = stationData[i].price
                newI = i
            }
        }
        return stationData[newI]
    }
    
    func saveGasStationData() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(stationData)
            try data.write(to: dataFilePath)
            
        } catch {
            print("error occur\(error)")
        }
    }
    
    func getGasStationData() {
        if let datax = try? Data(contentsOf: dataFilePath) {
            let decoder = PropertyListDecoder()
         
            do {
                let x = try decoder.decode([gasStations].self, from: datax)
                
                stationData = x
            
            } catch {
                print("error \(error)")
            }
        }
    }
}
