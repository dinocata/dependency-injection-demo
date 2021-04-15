import Foundation

class FruitBasket {
    let id: String = UUID().uuidString
    var fruits: [Fruit] = []
    
    var totalWeight: Float {
        return fruits.reduce(0) { $0 + $1.averageWeight }
    }
    
    var totalPrice: Float {
        return fruits.reduce(0) { $0 + $1.averageWeight * $1.pricePerKg }
    }
}
