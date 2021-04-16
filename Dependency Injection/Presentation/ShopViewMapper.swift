import Foundation

protocol ShopViewMapper {
    func mapShoppingCart(from selectedProducts: ShopVM.SelectedProducts) -> ShoppingCart
}

final class ShopViewMapperImpl: ShopViewMapper {
    
    func mapShoppingCart(from selectedProducts: ShopVM.SelectedProducts) -> ShoppingCart {
        let products = selectedProducts.map { $1 }
        
        return .init(
            id: UUID().uuidString,
            products: products
        )
    }
}
