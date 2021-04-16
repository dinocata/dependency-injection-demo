import RxCocoa

class ShopVM {
    
    // Dependencies
    private let getProductsUseCase: GetProductsUseCase
    private let purchaseProductsUseCase: PurchaseProductsUseCase
    private let mapper: ShopViewMapper
    
    // Stored data
    private var selectedProducts: SelectedProducts = [:]
    
    init(getProductsUseCase: GetProductsUseCase,
         purchaseProductsUseCase: PurchaseProductsUseCase,
         mapper: ShopViewMapper) {
        
        self.getProductsUseCase = getProductsUseCase
        self.purchaseProductsUseCase = purchaseProductsUseCase
        self.mapper = mapper
    }
}

extension ShopVM: ViewModelType {
    
    typealias SelectedProducts = [String: Product]
    
    struct Input {
        let selectProduct: Driver<Product>
        let purchase: Driver<Void>
    }
    
    struct Output {
        let productList: Driver<[Product]>
        let selectedProducts: Driver<SelectedProducts>
        let purchaseResult: Driver<Bool>
    }
    
    func transform(input: Input) -> Output {
        
        let productList = self.getProductsUseCase.execute()
            .asDriver(onErrorJustReturn: [])
        
        let selectedProducts = input.selectProduct
            .map { [unowned self] product -> SelectedProducts in
                
                // If product is already added to the shopping cart, tapping it again will remove it from the list
                if self.selectedProducts[product.id] != nil {
                    self.selectedProducts.removeValue(forKey: product.id)
                } else {
                    self.selectedProducts[product.id] = product
                }
                
                return self.selectedProducts
            }
        
        let purchaseResult = input.purchase
            .withLatestFrom(selectedProducts)
            .asObservable()
            .map(mapper.mapShoppingCart)
            .flatMapLatest(purchaseProductsUseCase.execute)
            .asDriver(onErrorJustReturn: false)
        
        return .init(
            productList: productList,
            selectedProducts: selectedProducts,
            purchaseResult: purchaseResult
        )
    }
}
