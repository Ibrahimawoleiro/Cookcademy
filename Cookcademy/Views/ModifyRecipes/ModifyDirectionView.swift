//
//  ModifyDirectionView.swift
//  Cookcademy
//
//  Created by Ibrahim Awoleiro on 2/16/24.
//

import SwiftUI

struct ModifyDirectionView: ModifyComponentView {
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    @Binding var direction: Direction
    let createAction: ((Direction) -> Void)
    init(component: Binding<Direction>, createAction: @escaping (Direction) -> Void) {
        self._direction = component
        self.createAction = createAction
    }
    @Environment(\.presentationMode) private var mode
    var body: some View {
        Form{
            TextField("Direction Description", text: $direction.description)
                .listRowBackground(listBackgroundColor)
            Toggle("Optional", isOn: $direction.isOptional)
                .listRowBackground(listBackgroundColor)
            HStack {
                Spacer()
                Button("Save") {
                    createAction(direction)
                    mode.wrappedValue.dismiss()
                }
                Spacer()
            }
            .listRowBackground(listBackgroundColor)
        }
       
    }
}

struct ModifyDirectionView_Previews: PreviewProvider {
    @State static var emptyDirection = Direction(description: "", isOptional: false)
    static var previews: some View {
        NavigationView {
            ModifyDirectionView(component: $emptyDirection) { _ in return }
        }
    }
}
