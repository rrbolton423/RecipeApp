//
//  WebService.swift
//  RecipeApp
//
//  Created by Bolton, Romell on 3/18/25.
//

import Foundation

final class WebService {
    static let allRecipesEndpoint = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    static let marlformedDataEndpoint = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
    static let emptyDataEndpoint = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    
    static func getRecipeData(urlString: String) async throws -> [Recipe] {
        guard let url = URL(string: urlString) else {
            throw UserError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw UserError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let recipeResponse = try decoder.decode(RecipesResponse.self, from: data)
            return recipeResponse.recipes ?? []
        } catch {
            throw UserError.invalidData
        }
    }
    
    static func loadJson(filename fileName: String) -> [Recipe] {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(RecipesResponse.self, from: data)
                return jsonData.recipes ?? []
            } catch {
                print("error:\(error)")
            }
        }
        return []
    }
}
