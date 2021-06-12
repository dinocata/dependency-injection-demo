import RxSwift

protocol ShopService: Injectable, Singleton {
    func getProducts() -> Single<[Product]>
    func purchaseProducts(from shoppingCart: ShoppingCart) -> Single<Bool>
}

final class ShopServiceImpl: ShopService {
    
    func getProducts() -> Single<[Product]> {
        return .just(Product.allCases)
    }
    
    func purchaseProducts(from shoppingCard: ShoppingCart) -> Single<Bool> {
        return .just(true)
    }
}
