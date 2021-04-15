enum Fruit: String {
    case apple
    case orange
    case strawberry
    case banana
}

extension Fruit {
    
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
        case .apple: return 100
        case .orange: return 120
        case .strawberry: return 30
        case .banana: return 140
        }
    }
    
    var description: String {
        switch self {
        case .apple: return "Shiny apple"
        case .orange: return "Juicy orange"
        case .strawberry: return "Sweet strawberry"
        case .banana: return "Tasty banana"
        }
    }
}
