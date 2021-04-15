import RxSwift

protocol GetFruitsUseCase {
    func execute() -> Single<[Fruit]>
}

final class GetFruitsUseCaseImpl: GetFruitsUseCase {
    
    private let repository: FruitRepository
    
    init(repository: FruitRepository) {
        self.repository = repository
    }
    
    func execute() -> Single<[Fruit]> {
        return repository.getFruitList()
    }
}
