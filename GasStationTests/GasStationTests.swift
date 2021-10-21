//
//  GasStationTests.swift
//  GasStationTests
//
//  Created by csuftitan on 9/19/21.
//

import XCTest
@testable import GasStation

class ElectricStationTests: XCTestCase {

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
    
    func testPrice()  {

        var priceOfGas = Displaying_gas_price(price: 3)
        
        XCTAssertEqual(priceOfGas.getCurrentPrice(), 3)
        
        priceOfGas.changePrice(price: 5)
        XCTAssertEqual(priceOfGas.getCurrentPrice(), 5)
        
    }
    
    
    func testGasStationData()  {
        
        let gasData = GasStationData()
        
        XCTAssertEqual(gasData.arco.getTitle(), "arco")
        XCTAssertEqual(gasData.cosco.getTitle(), "costco")
        XCTAssertEqual(gasData.mobile.getTitle(), "mobile")
        XCTAssertEqual(gasData.shell.getTitle(), "shell")
        
        XCTAssertEqual(gasData.shell.getPrice(), 8)
        
        gasData.shell.setPrice(price: 9)
        
        XCTAssertEqual(gasData.shell.getPrice(), 9)
        
        
        
        
        
    }
    
    
}
