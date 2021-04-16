import RxSwift

protocol ShopService {
    func getProducts() -> Single<[Product]>
    func purchaseProducts(from shoppingCart: ShoppingCart) -> Single<Bool>
}

final class ShopServiceImpl: ShopService {
    
    func getProducts() -> Single<[Product]> {
        return .just(Fruit.allCases)
    }
    
    func purchaseProducts(from shoppingCard: ShoppingCart) -> Single<Bool> {
        return .just(true)
    }
}

extension ShopServiceImpl {
    static let shared: ShopService = ShopServiceImpl()
}

extension ShopRepositoryImpl {
    static let shared: ShopRepository = ShopRepositoryImpl(service: ShopServiceImpl.shared)
}
