//
//  RecipeDetailView.swift
//  RecipeApp
//
//  Created by Bolton, Romell on 3/18/25.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        VStack {
            Spacer()
            if let photoUrlLarge = recipe.photo_url_large {
                AsyncCachedImage(url: URL(string: photoUrlLarge)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(8.0)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 167, height: 250)
                .offset(y: -130)
                .padding(.bottom, -130)
            }
            else {
                Text("🍽️")
                    .font(.system(size: 150))
            }
            
            Text(recipe.name ?? "N/A").font(.title)
                .padding()
            Text(recipe.cuisine ?? "N/A")
            
            Divider()
            
            VStack(alignment: .leading) {
                if let sourceUrl = recipe.source_url {
                    Text(.init("Source: \(sourceUrl)"))
                        .padding([.top, .horizontal])
                }
                if let youtubeUrl = recipe.youtube_url {
                    Text(.init("Youtube: \(youtubeUrl)"))
                        .padding([.top, .horizontal])
                }
            }
            
            Spacer()
        }
        .foregroundColor(colorScheme == .dark ? .white : .black)
    }
}

#Preview {
    RecipeDetailView(recipe: Recipe(cuisine: "Malaysian",
                                    name: "Apam Balik",
                                    photo_url_large: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
                                    photo_url_small: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
                                    source_url: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
                                    uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
                                    youtube_url: "https://www.youtube.com/watch?v=6R8ffRRJcrg"))
}
