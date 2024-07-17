//
//  RecipeViewModel.swift
//  Cookcademy
//
//  Created by Ibrahim Awoleiro on 2/13/24.
//

import Foundation

class RecipeViewModel: ObservableObject{
    @Published var recipes: [Recipe] = Recipe.testRecipes
    
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in recipes {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
    
    func add(_ recipe: Recipe) {
        if recipe.isValid {
            recipes.append(recipe)
        }
    }
    
    func index(of recipe: Recipe)-> Int?{
        for i in recipes.indices{
            if recipes[i].id == recipe.id{
                return i
            }
        }
        return nil
    }
    
    var favoriteRecipes: [Recipe]{
        recipes.filter{$0.isFavorite}
    }
    
    private var recipesFileURL: URL {
        do {
            let documentsDirectory = try FileManager.default.url(for: .documentDirectory,in: .userDomainMask,appropriateFor: nil,create: true)
            return documentsDirectory.appendingPathComponent("recipeData")
        }
        catch {
            fatalError("An error occurred while getting the url: \(error)")
        }
    }
    
    func saveRecipes()->Void{
        do{
            let encodedData = try JSONEncoder().encode(recipes)
            try encodedData.write(to: recipesFileURL)
        }catch{
            fatalError("An error occurred while saving recipes: \(error)")
        }
    }
    
    func loadRecipes() {
        guard let data = try? Data(contentsOf: recipesFileURL) else { return }
        do {
            let savedRecipes = try JSONDecoder().decode([Recipe].self, from: data)
            recipes = savedRecipes
        }
        catch {
            fatalError("An error occurred while loading recipes: \(error)")
        }
    }
    
    func add(recipe: Recipe) {
        if recipe.isValid {
            recipes.append(recipe)
            saveRecipes()
        }
    }
}
    
