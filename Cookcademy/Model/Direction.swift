//
//  Direction.swift
//  Cookcademy
//
//  Created by Ibrahim Awoleiro on 2/13/24.
//

import Foundation

struct Direction: RecipeComponent{
    var description: String
    var isOptional: Bool
    
    init(description: String, isOptional: Bool) {
        self.description = description
        self.isOptional = isOptional
    }
    
    init() {
        self.init(description: "", isOptional: false)
    }
}
