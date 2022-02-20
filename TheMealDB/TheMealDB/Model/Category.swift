//
//  Category.swift
//  TheMealDB
//
//  Created by Jake Haslam on 2/17/22.
//

import Foundation

struct CategoryList: Decodable {
    let categories: [Category]
}

struct Category: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "strCategory"
        case categoryThumbnail = "strCategoryThumb"
    }
    
    let name: String
    let categoryThumbnail: String
}
