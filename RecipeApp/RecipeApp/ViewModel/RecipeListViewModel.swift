//
//  RecipeListViewModel.swift
//  RecipeApp
//
//  Created by Bolton, Romell on 3/18/25.
//

import Foundation

@MainActor
final class RecipeListViewModel: ObservableObject {
    enum LoadingState {
        case loading
        case loaded
        case error(error: UserError?)
        case empty
    }
    
    @Published var loadingState: LoadingState = .loading
    @Published var recipes: [Recipe]?
    @Published var userError: UserError?
    
    func getRecipes() async {
        self.loadingState = .loading
        do {
            self.recipes = try await WebService.getRecipeData(urlString: WebService.allRecipesEndpoint)
            //            self.recipes = WebService.loadJson(filename: "recipes") // for testing local .json file
            if let recipes = self.recipes, !recipes.isEmpty {
                self.loadingState = .loaded
            }
            else {
                self.loadingState = .empty
            }
        } catch(let error) {
            userError = UserError.custom(error: error)
            self.loadingState = .error(error: userError)
        }
    }
}
