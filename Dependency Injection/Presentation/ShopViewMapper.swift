import Foundation

protocol ShopViewMapper: Injectable {
    func mapShoppingCart(from selectedProducts: ShopVM.SelectedProducts) -> ShoppingCart
    func mapTotalPrice(from selectedProducts: ShopVM.SelectedProducts) -> String
}

final class ShopViewMapperImpl: ShopViewMapper {
    
    func mapShoppingCart(from selectedProducts: ShopVM.SelectedProducts) -> ShoppingCart {
        //let products = selectedProducts.map { $1 }
        
        return .init(
            id: UUID().uuidString,
            products: Array(selectedProducts)
        )
    }
    
    func mapTotalPrice(from selectedProducts: ShopVM.SelectedProducts) -> String {
        let price = selectedProducts.reduce(0) { $0 + $1.pricePerKg * $1.averageWeight }
        let formattedPrice = price.formatPrice ?? ""
        return "Total price: \(formattedPrice)"
    }
}
