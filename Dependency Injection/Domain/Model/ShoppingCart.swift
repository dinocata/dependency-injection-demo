import Foundation

struct ShoppingCart {
    let id: String
    let products: [Product]
    
    var totalPrice: Float {
        return products.reduce(0) { $0 + $1.averageWeight * $1.pricePerKg }
    }
}
