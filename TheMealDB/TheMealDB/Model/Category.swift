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
        case category = "strCategory"
        case categoryThumbnail = "strCategoryThumb"
    }
    
    let category: String
    let categoryThumbnail: String
}
