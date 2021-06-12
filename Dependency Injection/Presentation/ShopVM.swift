import RxCocoa

final class ShopVM: Injectable {
    
    // Dependencies
    private let getProductsUseCase: GetProductsUseCase
    private let purchaseProductsUseCase: PurchaseProductsUseCase
    private let mapper: ShopViewMapper
    
    // Stored data
    private var selectedProducts: SelectedProducts = []
    
    init(getProductsUseCase: GetProductsUseCase,
         purchaseProductsUseCase: PurchaseProductsUseCase,
         mapper: ShopViewMapper) {
        
        self.getProductsUseCase = getProductsUseCase
        self.purchaseProductsUseCase = purchaseProductsUseCase
        self.mapper = mapper
    }
}

extension ShopVM: ViewModelType {
    
    typealias SelectedProducts = Set<Product>
    
    struct Input {
        let selectProduct: Driver<Product>
        let purchase: Driver<Void>
    }
    
    struct Output {
        let productList: Driver<[Product]>
        let selectedProducts: Driver<SelectedProducts>
        let totalPrice: Driver<String>
    }
    
    func transform(input: Input) -> Output {
        
        let productList = self.getProductsUseCase.execute()
            .asDriver(onErrorJustReturn: [])
        
        let selectedProducts = input.selectProduct
            .map { [unowned self] product -> SelectedProducts in
                
                // If product is already added to the shopping cart, tapping it again will remove it from the list
                if self.selectedProducts.contains(product) {
                    self.selectedProducts.remove(product)
                } else {
                    self.selectedProducts.insert(product)
                }
                
                return self.selectedProducts
            }
        
        let purchaseResult = input.purchase
            .withLatestFrom(selectedProducts)
            .asObservable()
            .map(mapper.mapShoppingCart)
            .flatMapLatest(purchaseProductsUseCase.execute)
            .map { [weak self] success -> SelectedProducts in
                guard let self = self else {
                    return []
                }
                if success {
                    self.selectedProducts.removeAll()
                }
                return self.selectedProducts
            }
            .asDriver(onErrorJustReturn: [])
        
        let selectedProductsMerge = Driver.merge(selectedProducts, purchaseResult)
        
        let totalPrice = selectedProductsMerge
            .map(mapper.mapTotalPrice)
        
        return .init(
            productList: productList,
            selectedProducts: selectedProductsMerge,
            totalPrice: totalPrice
        )
    }
}
