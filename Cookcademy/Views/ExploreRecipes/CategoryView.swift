//
//  CategoryView.swift
//  Cookcademy
//
//  Created by Ibrahim Awoleiro on 2/13/24.
//

import SwiftUI

struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.35)
            Text(category.rawValue)
                .font(.title)
        }
    }
}

#Preview {
    CategoryView(category: MainInformation.Category.breakfast)
}
