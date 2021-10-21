//
//  GasStationTests.swift
//  GasStationTests
//
//  Created by csuftitan on 9/19/21.
//

import XCTest
@testable import GasStation

class GasStationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testValid() {
        let interface = Direction()
        XCTAssertEqual(interface.valid, true)
    }
    
    func testCheckAddress() {
        let interface = Direction()
        XCTAssertEqual(interface.street_address, "")
        XCTAssertEqual(gas1.address,"123 main st")
        XCTAssertEqual(gas2.address,"420 high st")
        XCTAssertEqual(gas3.address,"327 beach st")
        XCTAssertEqual(gas4.address,"342 low st")
        XCTAssertEqual(gas5.address,"767 number st")
        XCTAssertEqual(gas6.address,"211 car st")
    }
    
    func testCheckPossibleGasStation() {
        let interface = Direction()
        XCTAssertEqual(interface.possibleGasStation, ["none"])
        XCTAssertEqual(gas1.name,"Chevron")
        XCTAssertEqual(gas2.name,"Arco")
        XCTAssertEqual(gas3.name,"Shell")
        XCTAssertEqual(gas4.name,"Costco")
        XCTAssertEqual(gas5.name,"76")
        XCTAssertEqual(gas6.name,"Mobil")
    }
    
    
    func testMethod_checkStreetAddress() {
        let interface = Direction()
        XCTAssertEqual(interface.checkStreetAddress(), "")
        XCTAssertEqual(gas1.address,"123 main st")
        XCTAssertEqual(gas2.address,"420 high st")
        XCTAssertEqual(gas3.address,"327 beach st")
        XCTAssertEqual(gas4.address,"342 low st")
        XCTAssertEqual(gas5.address,"767 number st")
        XCTAssertEqual(gas6.address,"211 car st")
    }
    
    func testMethod_checkValid() {
        let interface = Direction()
        XCTAssertEqual(interface.checkValid(), true)
    }
    
    func testMethod_checkPossibleGasStation() {
        let interface = Direction()
        XCTAssertEqual(interface.checkPossibleGasStation(), ["none"])
    }
}
