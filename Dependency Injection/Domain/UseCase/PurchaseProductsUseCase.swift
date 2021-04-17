import RxSwift

protocol PurchaseProductsUseCase: Injectable {
    func execute(shoppingCart: ShoppingCart) -> Single<Bool>
}

final class PurchaseProductsUseCaseImpl: PurchaseProductsUseCase {
    
    private let repository: ShopRepository
    
    init(repository: ShopRepository) {
        self.repository = repository
    }
    
    func execute(shoppingCart: ShoppingCart) -> Single<Bool> {
        return self.repository.purchaseProducts(from: shoppingCart)
    }
}
