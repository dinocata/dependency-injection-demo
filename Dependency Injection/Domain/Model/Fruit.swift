enum Fruit: String, CaseIterable {
    case apple
    case orange
    case strawberry
    case banana
}

extension Fruit: Product {
    
    var id: String {
        self.rawValue
    }
    
    var name: String {
        return self.rawValue.capitalized
    }
    
    var description: String {
        switch self {
        case .apple: return "Shiny apple"
        case .orange: return "Juicy orange"
        case .strawberry: return "Sweet strawberry"
        case .banana: return "Tasty banana"
        }
    }
    
    var pricePerKg: Float {
        switch self {
        case .apple: return 10
        case .orange: return 15
        case .strawberry: return 20
        case .banana: return 12
        }
    }
    
    var averageWeight: Float {
        switch self {
        case .apple: return 0.100
        case .orange: return 0.120
        case .strawberry: return 0.30
        case .banana: return 0.140
        }
    }
}
