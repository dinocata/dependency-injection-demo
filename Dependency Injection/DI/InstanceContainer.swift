import Swinject

enum SingletonContainer {
    
    static let instance: Container = {
        let container = Container(defaultObjectScope: .container)
        
        container.register(ShopService.self) { _ in
            ShopServiceImpl()
        }
        
        container.register(ShopRepository.self) {
            ShopRepositoryImpl(service: $0.resolve())
        }
        
        return container
    }()
}

enum InstanceContainer {
    
    static let instance: Container = {
        let container = Container(parent: SingletonContainer.instance, defaultObjectScope: .transient)
        
        container.register(GetProductsUseCase.self) {
            GetProductsUseCaseImpl(repository: $0.resolve())
        }
        
        container.register(PurchaseProductsUseCase.self) {
            PurchaseProductsUseCaseImpl(repository: $0.resolve())
        }
        
        container.register(ShopViewMapper.self) { _ in
            ShopViewMapperImpl()
        }
        
        container.register(ShopVM.self) {
            ShopVM(getProductsUseCase: $0.resolve(),
                   purchaseProductsUseCase: $0.resolve(),
                   mapper: $0.resolve())
        }
        
        return container
    }()
}
