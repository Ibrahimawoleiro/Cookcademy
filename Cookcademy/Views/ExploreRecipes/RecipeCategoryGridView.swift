//
//  RecipeCategoryView.swift
//  Cookcademy
//
//  Created by Ibrahim Awoleiro on 2/13/24.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    
    @EnvironmentObject private var recipeData: RecipeViewModel
    
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(columns: [GridItem(),GridItem()]){
                    ForEach(MainInformation.Category.allCases,id: \.self){ category in
                        NavigationLink(destination: {RecipesListView(viewStyle: .singleCategory(category)).environmentObject(recipeData)}, label: {CategoryView(category: category)})
                    }
                }
                .navigationTitle("Categories")
            }
        }
    }
}



struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryGridView().environmentObject(RecipeViewModel())
    }
}

