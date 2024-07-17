//
//  ContentView.swift
//  Cookcademy
//
//  Created by Ibrahim Awoleiro on 2/12/24.
//

import SwiftUI

struct RecipesListView: View {
    
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    let viewStyle: ViewStyle
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    @State var isPresented: Bool = false
    @State var newRecipe: Recipe = Recipe()
    
    var body: some View {
        List{
            ForEach(self.recipes){ recipe in
                NavigationLink(destination: {
                    RecipeDetailView(recipe: self.binding(for: recipe))
                }, label: {Text(recipe.mainInformation.name)})
            }
            .listRowBackground(listBackgroundColor)
            .foregroundColor(listTextColor)
        }
        .navigationTitle(navigationTitle)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button(action: {
                    newRecipe = Recipe()
                    newRecipe.mainInformation.category = recipes.first?.mainInformation.category ?? .breakfast
                    isPresented = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
        }
        .sheet(isPresented: $isPresented, content: {
            NavigationView {
                ModifyRecipeView(recipe: $newRecipe)
                    .navigationTitle("Add a New Recipe")
                        .toolbar(content: {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Dismiss") {
                                    isPresented = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                if newRecipe.isValid {
                                    Button("Add") {
                                        recipeViewModel.add(newRecipe)
                                        isPresented = false
                                    }
                                }
                            }
                    })
            }

        })
    }
}

extension RecipesListView {
    private var recipes: [Recipe] {
        switch viewStyle {
            case let .singleCategory(category):
                return recipeViewModel.recipes(for: category)
            case .favorites:
                return recipeViewModel.favoriteRecipes
        }
    }
    
    private var navigationTitle: String {
        switch viewStyle {
            case let .singleCategory(category):
                return "\(category.rawValue) Recipes"
            case .favorites:
                return "Favorite Recipes"
        }
    }
    
    func binding(for recipe: Recipe) -> Binding<Recipe>{
        guard let index = recipeViewModel.index(of: recipe) else{
            fatalError("Recipe not found")
        }
        return $recipeViewModel.recipes[index]
    }
    
    enum ViewStyle {
        case favorites
        case singleCategory(MainInformation.Category)
    }
    
}

#Preview {
    NavigationView {
        RecipesListView(viewStyle: .singleCategory(.breakfast)).environmentObject(RecipeViewModel())
    }
}
