import RxCocoa

struct FruitsVM {
    
    private let getFruitsUseCase: GetFruitsUseCase
    private let buyFruitsUseCase: BuyFruitsUseCase
    
    init(getFruitsUseCase: GetFruitsUseCase,
         buyFruitsUseCase: BuyFruitsUseCase) {
        
        self.getFruitsUseCase = getFruitsUseCase
        self.buyFruitsUseCase = buyFruitsUseCase
    }
}

extension FruitsVM: ViewModelType {
    
    struct Input {
        // TODO
    }
    
    struct Output {
        // TODO
    }
    
    func transform(input: Input) -> Output {
        return .init()
    }
}
