//
//  Ingredient.swift
//  Cookcademy
//
//  Created by Ibrahim Awoleiro on 2/13/24.
//

import Foundation

struct Ingredient: RecipeComponent{
    var name: String
    var quantity: Double
    var unit: Unit
    
    var description: String {
        let formattedQuantity = String(format: "%g", quantity)
        switch unit {
            case .none:
                let formattedName = quantity == 1 ? name : "\(name)s"
                return "\(formattedQuantity) \(formattedName)"
            default:
                if quantity == 1 {
                    return "1 \(unit.singularName) \(name)"
                } else {
                    return "\(formattedQuantity) \(unit.rawValue) \(name)"
                }
        }
    }
    
    init(name: String, quantity:Double, unit: Unit) {
        self.name = name
        self.quantity = quantity
        self.unit = unit
    }
    
    enum Unit: String, CaseIterable, Codable {
        case oz = "Ounces"
        case g = "Grams"
        case cups = "Cups"
        case tbs = "Tablespoons"
        case tsp = "Teaspoons"
        case none = "No units"
        
        var singularName: String{
            String(self.rawValue.dropLast())
        }
    }
    
    init() {
        self.init(name: "", quantity: 1.0, unit: .none)
    }
    
}
