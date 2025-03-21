//
//  WebServiceTests.swift
//  RecipeAppTests
//
//  Created by Bolton, Romell on 3/18/25.
//

import Testing
import XCTest
@testable import RecipeApp

final class WebServiceTests: XCTestCase {    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    @MainActor
    func test_all_recipes_endpoint() async throws {
        let recipes = try await WebService.getRecipeData(urlString: WebService.allRecipesEndpoint)
        XCTAssertFalse(recipes.isEmpty)
        let firstRecipe = recipes.first
        XCTAssertEqual(firstRecipe?.cuisine, "Malaysian")
        XCTAssertEqual(firstRecipe?.name, "Apam Balik")
        XCTAssertEqual(firstRecipe?.photo_url_large, "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg")
        XCTAssertEqual(firstRecipe?.photo_url_small, "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg")
        XCTAssertEqual(firstRecipe?.source_url, "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ")
        XCTAssertEqual(firstRecipe?.uuid, "0c6ca6e7-e32a-4053-b824-1dbf749910d8")
        XCTAssertEqual(firstRecipe?.youtube_url, "https://www.youtube.com/watch?v=6R8ffRRJcrg")
    }
    
    @MainActor
    func test_malformed_data_endpoint() async throws {
        let recipes = try await WebService.getRecipeData(urlString: WebService.marlformedDataEndpoint)
        XCTAssertFalse(recipes.isEmpty)
        let malformedRecipe = recipes[10]
        XCTAssertNil(malformedRecipe.name)
        XCTAssertNil(malformedRecipe.youtube_url)
    }
    
    @MainActor
    func test_empty_data_endpoint() async throws {
        let recipes = try await WebService.getRecipeData(urlString: WebService.emptyDataEndpoint)
        XCTAssertTrue(recipes.isEmpty)
    }
}
