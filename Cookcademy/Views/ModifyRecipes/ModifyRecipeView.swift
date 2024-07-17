//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by Ibrahim Awoleiro on 2/13/24.
//

import SwiftUI

struct ModifyRecipeView: View {
    
    enum Selection : String, CaseIterable{
        case main
        case ingredients
        case directions
    }
    
    @Binding var recipe: Recipe
    @State private var selection: Selection = Selection.main
    
    var body: some View {
                
        VStack {
            Picker("Select Recipe Component", selection: $selection){
                ForEach(Selection.allCases, id:\.self){ option in
                    Text(option.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            switch selection {
                case .main:
                    ModifyMainInformationView(mainInformation: $recipe.mainInformation)
                case .ingredients:
                    ModifyComponentsView<Ingredient, ModifyIngredientView>(components: $recipe.ingredients)
                case .directions:
                    ModifyComponentsView<Direction, ModifyDirectionView>(components: $recipe.directions)
            }
            Spacer()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        @State  var recipe = Recipe(mainInformation: MainInformation(name: "Dad's Mashed Potatoes",
                                                             description: "Buttery salty mashed potatoes!",
                                                             author: "Josh",
                                                             category: .dinner),
                            ingredients: [
                                Ingredient(name: "Potatoes", quantity: 454, unit: .g),
                                Ingredient(name: "Butter", quantity: 1, unit: .tbs),
                                Ingredient(name: "Milk", quantity: 0.5, unit: .cups),
                                Ingredient(name: "Salt", quantity: 2, unit: .tsp)
                            ],
                            directions:  [
                                Direction(description: "Put peeled potatoes in water and bring to boil ~15 min (once you can cut them easily", isOptional: false),
                                Direction(description: "In the meantime, Soften the butter by heading in a microwave for 30 seconds", isOptional: false),
                                Direction(description: "Drain the now soft potatoes", isOptional: false),
                                Direction(description: "Mix vigorously with milk, salt, and butter", isOptional: false)
                            ]
        )
        return NavigationView {
            ModifyRecipeView(recipe: .constant(recipe))
        }
    }
    
}


