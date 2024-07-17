//
//  MainTabView.swift
//  Cookcademy
//
//  Created by Ibrahim Awoleiro on 2/19/24.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var recipeData: RecipeViewModel =  RecipeViewModel()
    
    var body: some View {
        TabView{
            RecipeCategoryGridView()
                .tabItem {
                    Label("Recipes",systemImage: "list.dash")
                }
            
            NavigationView {
                RecipesListView(viewStyle: .favorites)
            }.tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            
        }
        .environmentObject(recipeData)
        .onAppear {
            recipeData.loadRecipes()
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
