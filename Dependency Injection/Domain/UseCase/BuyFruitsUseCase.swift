import RxSwift

protocol BuyFruitsUseCase {
    func execute(fruits: [Fruit]) -> Completable
}

final class BuyFruitsUseCaseImpl: BuyFruitsUseCase {
    
    private let repository: FruitRepository
    
    init(repository: FruitRepository) {
        self.repository = repository
    }
    
    func execute(fruits: [Fruit]) -> Completable {
        return repository.buyFruits()
    }
}
