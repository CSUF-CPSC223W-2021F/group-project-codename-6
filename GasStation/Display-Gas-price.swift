
import Foundation




struct Displaying_gas_price {

    var price:Double
    
    init(price:Double) {
        self.price = price
    }
    mutating func changePrice(price:Double)  {
        
        self.price = price
    }
    
    func getCurrentPrice() -> Double {
        
        return self.price
    }
    
    
    
    
}
