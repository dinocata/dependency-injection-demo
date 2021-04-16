import RxCocoa

struct ShopVM {
    
    private let getProductsUseCase: GetProductsUseCase
    private let purchaseProductsUseCase: PurchaseProductsUseCase
    
    init(getProductsUseCase: GetProductsUseCase,
         purchaseProductsUseCase: PurchaseProductsUseCase) {
        
        self.getProductsUseCase = getProductsUseCase
        self.purchaseProductsUseCase = purchaseProductsUseCase
    }
}

extension ShopVM: ViewModelType {
    
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
