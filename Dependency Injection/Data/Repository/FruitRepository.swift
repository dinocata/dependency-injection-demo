import RxSwift

protocol FruitRepository {
    func getFruitList() -> Single<[Fruit]>
    func getFruitBasket() -> Observable<FruitBasket>
    func addFruitToBasket(fruit: Fruit) -> Completable
    func clearBasket() -> Completable
    func buyFruits() -> Completable
}

final class FruitRepositoryImpl: FruitRepository {
    
    private let service: FruitService
    
    init(service: FruitService) {
        self.service = service
    }
    
    func getFruitList() -> Single<[Fruit]> {
        return service.getFruitList()
    }
    
    func getFruitBasket() -> Observable<FruitBasket> {
        return service.getFruitBasket()
    }
    
    func addFruitToBasket(fruit: Fruit) -> Completable {
        return service.addFruitToBasket(fruit: fruit)
    }
    
    func clearBasket() -> Completable {
        return service.clearBasket()
    }
    
    func buyFruits() -> Completable {
        return service.buyFruits()
    }
}
