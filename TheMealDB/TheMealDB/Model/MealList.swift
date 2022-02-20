//
//  Meal.swift
//  TheMealDB
//
//  Created by Jake Haslam on 2/17/22.
//

import Foundation

struct MealList: Decodable {
    let meals: [Meals]
}

struct Meals: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case mealID = "idMeal"
        case mealsThumbnail = "strMealThumb"
    }
    
    let name: String
    let mealID: String
    let mealsThumbnail: String
}


