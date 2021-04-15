import RxSwift

protocol FruitService {
    func getFruitList() -> Single<[Fruit]>
    func buyFruits(_ fruits: [Fruit]) -> Single<FruitBasket>
}
