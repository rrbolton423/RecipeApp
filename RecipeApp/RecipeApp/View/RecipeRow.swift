//
//  RecipeRow.swift
//  RecipeApp
//
//  Created by Bolton, Romell on 3/18/25.
//

import SwiftUI

struct RecipeRow: View {
    let recipe: Recipe
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        HStack {
            if let photoUrlSmall = recipe.photo_url_small {
                AsyncCachedImage(url: URL(string: photoUrlSmall)) { image in
                    image
                        .scaledToFit()
                        .frame(width:80, height:80)
                        .cornerRadius(8.0)
                        .padding(8.0)
                } placeholder: {
                    ProgressView()
                }
                .frame(width:80, height:80)
            }
            else {
                Text("🍽️")
            }
            
            VStack(alignment: .leading) {
                Text(recipe.name ?? "N/A")
                    .font(.headline)
                Text(recipe.cuisine ?? "N/A")
                    .font(.subheadline)
            }
            .foregroundColor(colorScheme == .dark ? .white : .black)
        }
    }
}

#Preview {
    RecipeRow(recipe: Recipe(cuisine: "Malaysian",
                             name: "Apam Balik",
                             photo_url_large: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
                             photo_url_small: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
                             source_url: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
                             uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
                             youtube_url: "https://www.youtube.com/watch?v=6R8ffRRJcrg"))
}
