//
//  ModifyIngredientView.swift
//  Cookcademy
//
//  Created by Ibrahim Awoleiro on 2/14/24.
//

import SwiftUI

struct ModifyIngredientView: ModifyComponentView {
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    @Environment(\.presentationMode) private var mode
    let formatter: NumberFormatter
    @Binding var ingredient: Ingredient
    
    let createAction: ((Ingredient) -> Void)
    
    init(component: Binding<Ingredient>, createAction: @escaping (Ingredient) -> Void) {
        self._ingredient = component
        self.createAction = createAction
        self.formatter = NumberFormatter()
        self.formatter.numberStyle = .decimal
    }
    
    
    var body: some View {
        VStack {
            Form {
                TextField("Ingredient Name", text: $ingredient.name)
                    .listRowBackground(listBackgroundColor)
                Stepper(value: $ingredient.quantity, in: 0...100, step: 0.5) {
                    HStack {
                        Text("Quantity:")
                        TextField("Quantity", value: $ingredient.quantity, formatter: formatter)
                            .keyboardType(.numbersAndPunctuation)
                    }
                }
                .listRowBackground(listBackgroundColor)
                Picker(selection: $ingredient.unit, label:
                        HStack {
                    Text("Unit")
                    Spacer()
                    Text(ingredient.unit.rawValue)
                }) {
                    ForEach(Ingredient.Unit.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                    }
                }
                .listRowBackground(listBackgroundColor)
                .pickerStyle(MenuPickerStyle())
                HStack {
                    Spacer()
                    Button("Save", action: {
                        createAction(ingredient)
                    })
                    Spacer()
                }
                .listRowBackground(listBackgroundColor)
            }
            .foregroundColor(listTextColor)
        }
    }
}


struct ModifyIngredientView_Previews: PreviewProvider {
    @State static var emptyIngredient: Ingredient = Ingredient()
    static var ingredients: [Ingredient] = []
    static var previews: some View {
        NavigationView {
            ModifyIngredientView(component: $emptyIngredient){ ingredient in
                ingredients.append(ingredient)
                emptyIngredient = Ingredient()
            }
        }
    }
}

