//
//  ModifyMainInformationView.swift
//  Cookcademy
//
//  Created by Ibrahim Awoleiro on 2/14/24.
//

import SwiftUI

struct ModifyMainInformationView: View {
    
    @Binding var mainInformation: MainInformation
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    var body: some View {
        Form {
            TextField("Recipe Name", text: $mainInformation.name)
                .listRowBackground(listBackgroundColor)
            TextField("Author", text: $mainInformation.author)
                .listRowBackground(listBackgroundColor)
            Section(header: Text("Description")) {
                TextEditor(text: $mainInformation.description)
                .listRowBackground(listBackgroundColor)
            }
            Picker(selection: $mainInformation.category, label:
                    HStack {
                Text("Category")
                Spacer()
                Text(mainInformation.category.rawValue)
            }) {
                ForEach(MainInformation.Category.allCases,
                        id: \.self) { category in
                    Text(category.rawValue)
                }
            }
            .listRowBackground(listBackgroundColor)
            .pickerStyle(MenuPickerStyle())
            
        }
        .foregroundColor(listTextColor)
    }
}

struct MainInformation_preview : PreviewProvider {
    static var previews: some View{
        @State var mainInformationTester: MainInformation = MainInformation(name: "Test Name", description: "Test Description",author: "Test Author",category: .lunch)
        ModifyMainInformationView(mainInformation: $mainInformationTester)
    }
}
