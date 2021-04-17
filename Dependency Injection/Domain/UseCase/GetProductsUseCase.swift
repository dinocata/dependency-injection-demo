import RxSwift

protocol GetProductsUseCase: Injectable {
    func execute() -> Single<[Product]>
}

final class GetProductsUseCaseImpl: GetProductsUseCase {
    
    private let repository: ShopRepository
    
    init(repository: ShopRepository) {
        self.repository = repository
    }
    
    func execute() -> Single<[Product]> {
        return repository.getProducts()
    }
}
