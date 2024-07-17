//
//  ModifyComponentView.swift
//  Cookcademy
//
//  Created by Ibrahim Awoleiro on 2/17/24.
//

import Foundation
import SwiftUI

protocol ModifyComponentView: View {
    associatedtype Component
    init(component: Binding<Component>, createAction: @escaping (Component) -> Void)
}
