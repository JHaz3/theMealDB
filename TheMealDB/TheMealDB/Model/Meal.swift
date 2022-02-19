//
//  Meal.swift
//  TheMealDB
//
//  Created by Jake Haslam on 2/17/22.
//

import Foundation

struct MealDetailList: Decodable {
    enum Keys: String, CodingKey {
        case mealDetails = "meals"
    }
    let mealDetails: [Meals]
}

struct Meal: Decodable {
    let name: String
    let instructions: String
    let mealThumbnail: String
    
}


//extension Meal {
//    struct Ingredient: Decodable {
//        let ingredient: String
//        let measurement: String
//    }
//}
//
//extension Meal {
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: Keys.)
//}
