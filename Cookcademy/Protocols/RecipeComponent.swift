//
//  RecipeComponent.swift
//  Cookcademy
//
//  Created by Ibrahim Awoleiro on 2/17/24.
//

import Foundation
protocol RecipeComponent: CustomStringConvertible, Codable {
    init()
    static func singularName() -> String
    static func pluralName() -> String
}


extension RecipeComponent {
    static func singularName() -> String {
        String(describing: self).lowercased()
    }
    static func pluralName() -> String {
        self.singularName() + "s"
    }
}
