import Foundation

protocol ShopViewMapper {
    func mapShoppingCart(from selectedProducts: ShopVM.SelectedProducts) -> ShoppingCart
    func mapTotalPrice(from selectedProducts: ShopVM.SelectedProducts) -> String
}

final class ShopViewMapperImpl: ShopViewMapper {
    
    func mapShoppingCart(from selectedProducts: ShopVM.SelectedProducts) -> ShoppingCart {
        let products = selectedProducts.map { $1 }
        
        return .init(
            id: UUID().uuidString,
            products: products
        )
    }
    
    func mapTotalPrice(from selectedProducts: ShopVM.SelectedProducts) -> String {
        let products = selectedProducts.map { $1 }
        let price = products.reduce(0) { $0 + $1.pricePerKg * $1.averageWeight }
        let formattedPrice = price.formatPrice ?? ""
        return "Total price: \(formattedPrice)"
    }
}
