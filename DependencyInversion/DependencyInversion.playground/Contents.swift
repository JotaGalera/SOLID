// Dependency Inversion principle

// High-level modules should not depend on low-level modules. Both should depend on abstractions.
class ProductRepository {
    func getProducts() -> String {
        return "This is a product"
    }
}

class ProductCatalog {
    // It is at this moment that Product Repository has begun a Product Catalog dependency, so in the future if Product Repository suffers any change, Product Catalog could be affected by that change.
    var repository = ProductRepository()
    
    func getProductList() -> String {
        return repository.getProducts()
    }
}

// Solution: Dependency injection
protocol Repository {
    func getProducts() -> String
}

class ProductRepositoryy: Repository {
    func getProducts() -> String {
        return "This is a product"
    }
}

class ProductCatalogg {
    //The abstraction lets Product Catalog uses a different repository, in case a new implementation will be added to the software in the future.
    var repository: Repository
    
    init(repository: Repository){
        self.repository = repository
    }
    
    func getProductList() -> String {
        return repository.getProducts()
    }
}
