import Swinject

enum SingletonContainer {
    
    static let instance: Container = {
        let container = Container(defaultObjectScope: .container)
        
        container.register(ShopService.self) { _ in
            ShopServiceImpl()
        }
        
        container.register(ShopRepository.self) {
            ShopRepositoryImpl(service: $0.resolve(ShopService.self)!)
        }
        
        return container
    }()
}

enum InstanceContainer {
    
    static let instance: Container = {
        let container = Container(parent: SingletonContainer.instance, defaultObjectScope: .transient)
        
        container.register(GetProductsUseCase.self) {
            GetProductsUseCaseImpl(repository: $0.resolve(ShopRepository.self)!)
        }
        
        container.register(PurchaseProductsUseCase.self) {
            PurchaseProductsUseCaseImpl(repository: $0.resolve(ShopRepository.self)!)
        }
        
        container.register(ShopViewMapper.self) { _ in
            ShopViewMapperImpl()
        }
        
        container.register(ShopVM.self) {
            ShopVM(getProductsUseCase: $0.resolve(GetProductsUseCase.self)!,
                   purchaseProductsUseCase: $0.resolve(PurchaseProductsUseCase.self)!,
                   mapper: $0.resolve(ShopViewMapper.self)!)
        }
        
        return container
    }()
}
