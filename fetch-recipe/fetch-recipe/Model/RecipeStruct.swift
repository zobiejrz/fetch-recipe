//
//  RecipeStruct.swift
//  fetch-recipe
//
//  Created by Ben Zobrist on 1/7/25.
//

import Foundation

struct Root: Decodable {
    let recipes: [Recipe]
    
    enum CodingKeys : String, CodingKey { case recipes = "recipes" }
}

struct Recipe: Decodable, Identifiable {

    let cuisine: String?
    let name: String?
    let photo_url_large: String?
    let photo_url_small: String?
    let uuid: String?
    let source_url: String?
    let youtube_url: String?

    var id: String? {
        get { self.uuid }
    }
}
