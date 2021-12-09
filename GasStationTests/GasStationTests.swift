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
    
    let user = UserInfo(firstname: "my", lastname: "name", username: "is", email: "123@gmail.com", password: "1234", phonenumber: "9091258400", address: "16728 Milky Way Drive", birthdate: "11/22/21")

    func testPrice()  {

        var priceOfGas = Displaying_gas_price(price: 3)
        
        XCTAssertEqual(priceOfGas.getCurrentPrice(), 3)
        
        priceOfGas.changePrice(price: 5)
        XCTAssertEqual(priceOfGas.getCurrentPrice(), 5)
        
    }
    
    
    func testGasStationData()  {
        
        let gasData = gasStationsData()
        
        XCTAssertEqual(gasData.arco.getTitle(), "arco")
        XCTAssertEqual(gasData.cosco.getTitle(), "costco")
        XCTAssertEqual(gasData.mobile.getTitle(), "mobile")
        XCTAssertEqual(gasData.shell.getTitle(), "shell")
        
        XCTAssertEqual(gasData.shell.getPrice(), 8)
        
        gasData.shell.setPrice(price: 9)
        
        XCTAssertEqual(gasData.shell.getPrice(), 9)
    }
 
    func testInput() {
        let test = userInput()
        XCTAssertEqual(test.input, "")
    }
    
    func testUserinit() {
        XCTAssertEqual(user.firstname, "my")
        XCTAssertEqual(user.lastname, "name")
        XCTAssertEqual(user.username, "is")
        XCTAssertEqual(user.email, "123@gmail.com")
        XCTAssertEqual(user.password, "1234")
        XCTAssertEqual(user.phonenumber, "9091258400")
        XCTAssertEqual(user.homeaddress, "16728 Milky Way Drive")
        XCTAssertEqual(user.birthdate, "11/22/21")
        }
    
    func testFirstName() {
        XCTAssertEqual(user.firstname, "my")
    }
    
    func testLastName() {
        XCTAssertEqual(user.lastname, "name")
    }
    
    func testUserName() {
        XCTAssertEqual(user.username, "is")
    }
    
    func testEmail() {
        XCTAssertEqual(user.email, "123@gmail.com")
    }
    
    func testPassword() {
        XCTAssertEqual(user.password, "1234")
    }
    
    func testPhoneNumber() {
        XCTAssertEqual(user.phonenumber, "9091258400")
    }
    
    func testHomeaddress() {
        XCTAssertEqual(user.homeaddress, "16728 Milky Way Drive")
    }
    
    func testBirthdate() {
        XCTAssertEqual(user.birthdate, "11/22/21")
    }
    
    func testGetfirstname(){
        XCTAssertEqual(user.getfirstName(), "my")
    }
    
    func testGetlastname() {
        XCTAssertEqual(user.getlastName(), "name")
    }
    
    func testGetusername(){
        XCTAssertEqual(user.getUsername(), "is")
    }
    
    func testGetemail(){
        XCTAssertEqual(user.getEmail(), "123@gmail.com")
    }
    
    func testGetpassword(){
        XCTAssertEqual(user.getPassword(), "1234")
    }
    
    func testGetphonenumber() {
        XCTAssertEqual(user.getPhone(), "9091258400")
    }
    
    func testGetaddress() {
        XCTAssertEqual(user.getAddress(), "16728 Milky Way Drive")
    }
    
    func testGetbirthdate(){
        XCTAssertEqual(user.getBirthDate(), "11/22/21")
    }
    
    func testvalidGasName(){
        let direction = Direction()
        
        XCTAssertEqual(direction.checkValid("Arco"),true)
        XCTAssertEqual(direction.checkValid("Shell"),true)
        XCTAssertEqual(direction.checkValid("Chevron"),true)
        XCTAssertEqual(direction.checkValid("Mobil"),true)
        
        XCTAssertEqual(direction.checkValid("John's Pizza"),false)
        XCTAssertEqual(direction.checkValid("Gas station"),false)
        XCTAssertEqual(direction.checkValid("Gas"),false)
        XCTAssertEqual(direction.checkValid("Station"),false)
    }
}

