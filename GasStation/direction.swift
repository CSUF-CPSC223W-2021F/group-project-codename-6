//
//  direction.swift
//  GasStation
//
//  Created by csuftitan on 9/23/21.
//  Anthony Ngon

import Foundation

struct Direction {
    var valid: Bool = true
    var street_address: String = ""
    var possibleGasStation: [String] = ["none"]

    func checkStreetAddress() -> String {
        return street_address
    }

    func checkValid() -> Bool {
        return valid
    }

    func checkPossibleGasStation() -> [String] {
        return possibleGasStation
    }
}
