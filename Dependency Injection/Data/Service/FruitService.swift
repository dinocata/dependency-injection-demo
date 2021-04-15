import RxSwift

protocol FruitService {
    func getFruitList() -> Single<[Fruit]>
    func getFruitBasket() -> Observable<FruitBasket>
    func addFruitToBasket(fruit: Fruit) -> Completable
    func clearBasket() -> Completable
    func buyFruits() -> Completable
}

final class FruitServiceImpl: FruitService {
    
    private lazy var currentFruitBasket = FruitBasket()
    
    private lazy var fruitBasketSubject = BehaviorSubject<FruitBasket>(value: self.currentFruitBasket)
    
    func getFruitList() -> Single<[Fruit]> {
        return .just(Fruit.allCases)
    }
    
    func getFruitBasket() -> Observable<FruitBasket> {
        return fruitBasketSubject
    }

    func addFruitToBasket(fruit: Fruit) -> Completable {
        return .create { [unowned self] observer in
            
            currentFruitBasket.fruits.append(fruit)
            fruitBasketSubject.onNext(currentFruitBasket)
            
            observer(.completed)
            
            return Disposables.create()
        }
    }
    
    func clearBasket() -> Completable {
        return .create { [unowned self] observer in
            
            currentFruitBasket = .init()
            fruitBasketSubject.onNext(currentFruitBasket)
            
            observer(.completed)
            
            return Disposables.create()
        }
    }
    
    func buyFruits() -> Completable {
        return self.clearBasket()
    }
}
