//
//  MainInformation.swift
//  Cookcademy
//
//  Created by Ibrahim Awoleiro on 2/13/24.
//

import Foundation

struct MainInformation: Codable{
    var name: String
    var description: String
    var author: String
    var category: Category
    
    enum Category:String, CaseIterable, Codable{
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
        case dessert = "Dessert"
    }
    
    var isValid: Bool {
        !name.isEmpty && !description.isEmpty && !author.isEmpty
    }
    
}
