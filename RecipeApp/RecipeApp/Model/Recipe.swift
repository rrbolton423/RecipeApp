//
//  Recipe.swift
//  RecipeApp
//
//  Created by Bolton, Romell on 3/18/25.
//

import Foundation

struct RecipesResponse: Codable {
    let recipes: [Recipe]?
    
    enum CodingKeys: String, CodingKey {
        case recipes = "recipes"
    }
}

struct Recipe: Codable, Hashable, Identifiable {
    let id = UUID()
    let cuisine : String?
    let name : String?
    let photo_url_large : String?
    let photo_url_small : String?
    let source_url : String?
    let uuid : String?
    let youtube_url : String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case cuisine = "cuisine"
        case name = "name"
        case photo_url_large = "photo_url_large"
        case photo_url_small = "photo_url_small"
        case source_url = "source_url"
        case uuid = "uuid"
        case youtube_url = "youtube_url"
    }
}
