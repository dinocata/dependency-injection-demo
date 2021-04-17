import Foundation

extension Float {
    
    var formatPrice: String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        
        let numberFormat = NSNumber(value: self)
        return formatter.string(from: numberFormat)
    }
}
