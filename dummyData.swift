// Dummy Data will be stored here

class gasStation {
    var name: String
    var price: [String: Float]
    var address: String
    var coordinates: [String: Float]

    init(name: String, price: [String: Float], address: String, coordinates: [String: Float]) {
        self.name = name
        self.price = price
        self.address = address
        self.coordinates = coordinates
    }
}

class user {
    var firstName: String
    var lastName: String
    var homeAddress: String
    var phoneNumber: Int
    var userName: String
    var birthDate: String
    var email: String

    init(firstname: String, lastname: String, phonenumber: Int, homeAddress: String, birthdate: String, email: String, username: String)
    {
        self.firstName = firstname
        self.lastName = lastname
        self.phoneNumber = phonenumber
        self.homeAddress = homeAddress
        self.birthDate = birthdate
        self.email = email
        self.userName = username
    }
}

var gas1 = gasStation(name: "Chevron", price: ["Regular": 4.27, "Mid": 4.57, "Premium": 4.87], address: "123 main st", coordinates: ["Latitude": 11, "Longitude": 0])

var gas2 = gasStation(name: "Arco", price: ["Regular": 3.27, "Mid": 3.57, "Premium": 3.87], address: "420 high st", coordinates: ["Latitude": 11, "Longitude": 0])

var gas3 = gasStation(name: "Shell", price: ["Regular": 4.07, "Mid": 4.27, "Premium": 4.47], address: "327 beach st", coordinates: ["Latitude": 11, "Longitude": 0])

var gas4 = gasStation(name: "Costco", price: ["Regular": 3.85, "Mid": 4.05, "Premium": 4.15], address: "342 low st", coordinates: ["Latitude": 11, "Longitude": 0])

var gas5 = gasStation(name: "76", price: ["Regular": 4.38, "Mid": 4.68, "Premium": 4.98], address: "767 number st", coordinates: ["Latitude": 11, "Longitude": 0])

var gas6 = gasStation(name: "Mobil", price: ["Regular": 3.85, "Mid": 4.15, "Premium": 4.45], address: "211 car st", coordinates: ["Latitude": 11, "Longitude": 0])

// user dummy data
var user1 = user(firstname: "Amritpaul", lastname: "Sidhu", phonenumber: 9099048124, homeAddress: "You dont need to know this", birthdate: "10-22-2001", email: "asidhu2001@gmail.com", username: "DemonSlayer")

var user2 = user(firstname: "Billy", lastname: "Bob", phonenumber: 123456789, homeAddress: "12123 deex bin street", birthdate: "01-21-92", email: "billybob21@csu.fullerton.edu", username: "BillytheBob")
