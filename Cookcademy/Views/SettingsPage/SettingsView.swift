//
//  SettingsView.swift
//  Cookcademy
//
//  Created by Ibrahim Awoleiro on 2/20/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("hideOptionalSteps")  private var hideOptionalSteps: Bool = false
    @AppStorage("listBackgroundColor")  private var listBackgroundColor: Color = AppColor.background
    @AppStorage("listTextColor")  private var listTextColor: Color = AppColor.foreground
    var body: some View {
        NavigationView{
            Form{
                ColorPicker("List Background", selection: $listBackgroundColor)
                    .padding()
                    .listRowBackground(listBackgroundColor)
                ColorPicker("Text Color", selection: $listTextColor)
                    .padding()
                    .listRowBackground(listBackgroundColor)
                Toggle("Hide Optional Steps", isOn: $hideOptionalSteps)
                    .padding()
                    .listRowBackground(listBackgroundColor)
            }
            .foregroundColor(listTextColor)
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
