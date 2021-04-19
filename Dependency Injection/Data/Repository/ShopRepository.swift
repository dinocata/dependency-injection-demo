import RxSwift

protocol ShopRepository: Injectable, Singleton {
    func getProducts() -> Single<[Product]>
    func purchaseProducts(from shoppingCart: ShoppingCart) -> Single<Bool>
}

final class ShopRepositoryImpl: ShopRepository {
    
    private let service: ShopService
    
    init(service: ShopService) {
        self.service = service
    }
    
    func getProducts() -> Single<[Product]> {
        return service.getProducts()
    }
    
    func purchaseProducts(from shoppingCart: ShoppingCart) -> Single<Bool> {
        return service.purchaseProducts(from: shoppingCart)
    }
}
