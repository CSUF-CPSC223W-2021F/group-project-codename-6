//
//  GasStationTests.swift
//  GasStationTests
//
//  Created by csuftitan on 9/19/21.
//

@testable import GasStation
import XCTest

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

    func testinit() {
        let interface = userLocation(user: "Amritpaul Sidhu", userName: "Demonslaayer", location: "Cal State Fullerton")
        XCTAssertEqual(interface.user, "Amritpaul Sidhu")
        XCTAssertEqual(interface.userName, "Demonslaayer")
        XCTAssertEqual(interface.location, "Cal State Fullerton")
    }

    func testUser() {
        let interface = userLocation()
        XCTAssertEqual(user1.firstName, "Amritpaul")
        XCTAssertEqual(user1.lastName, "Sidhu")
        XCTAssertEqual(user1.phoneNumber, 9099048124)
        XCTAssertEqual(user1.birthDate, "10-22-2001")
        XCTAssertEqual(user1.email, "asidhu2001@gmail.com")
        XCTAssertEqual(interface.user, "")
    }

    func testLocation() {
        let interface = userLocation()
        XCTAssertEqual(gas3.address,  "327 beach st")
        XCTAssertEqual(user1.homeAddress, "You dont need to know this")
        XCTAssertEqual(user2.homeAddress, "12123 deex bin street")
        XCTAssertEqual(gas1.coordinates,  ["Latitude": 11, "Longitude": 0])
        XCTAssertEqual(interface.location, "")
    }

    func testUserName() {
        let interface = userLocation()
        XCTAssertEqual(gas5.name,  "76")
        XCTAssertEqual(user1.userName, "DemonSlayer")
        XCTAssertEqual(interface.userName, "")
    }
    
    func testfindUser()
    {
        let interface = userLocation()
        XCTAssertEqual(interface.findUser(), "")
    }
    
    func testfindLocation()
    {
        let interface = userLocation()
        XCTAssertEqual(interface.findLocation(), "")
    }
    
    func testdisplayUserName()
    {        
        let interface = userLocation()
        XCTAssertEqual(interface.displayUserName(), "")
    }
}
