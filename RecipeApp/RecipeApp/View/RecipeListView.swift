//
//  RecipeListView.swift
//  RecipeApp
//
//  Created by Bolton, Romell on 3/18/25.
//

import SwiftUI

struct RecipeListView: View {
    @ObservedObject private var viewModel = RecipeListViewModel()
    @Environment(\.colorScheme) private var colorScheme
    @State private var searchText: String = ""
    
    var filteredRecipes: [Recipe]? {
        if searchText.isEmpty {
            return viewModel.recipes
        } else {
            return viewModel.recipes?.filter { $0.name?.range(of: searchText, options: .caseInsensitive) != nil }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                colorScheme == .dark ? Color.black : Color.white
                
                switch viewModel.loadingState {
                case .loading:
                    ProgressView()
                case .error:
                    VStack {
                        if let errorDescription = viewModel.userError?.errorDescription {
                            Text(errorDescription)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .padding()
                            Text("Retry")
                                .foregroundColor(.blue)
                        }
                    }
                    .font(.headline)
                    .onTapGesture {
                        Task {
                            await viewModel.getRecipes()
                        }
                    }
                case .loaded:
                    if let recipes = filteredRecipes {
                        List(recipes, id: \.id) { recipe in
                            NavigationLink {
                                RecipeDetailView(recipe: recipe)
                            } label: {
                                HStack {
                                    RecipeRow(recipe: recipe)
                                }
                            }
                        }
                        .listStyle(.plain)
                        .listRowInsets(EdgeInsets())
                        .navigationTitle("Recipes")
                        .toolbarBackground(
                            colorScheme == .dark ? Color.black : Color.white,
                            for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
                        .searchable(text: $searchText)
                        .refreshable {
                            await viewModel.getRecipes()
                        }
                    }
                case .empty:
                    VStack(alignment: .center) {
                        Text("Oops, looks like there's no data...")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .padding()
                        Text("Retry")
                            .foregroundColor(.blue)
                    }
                    .font(.headline)
                    .onTapGesture {
                        Task {
                            await viewModel.getRecipes()
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.getRecipes()
        }
    }
}

#Preview {
    RecipeListView()
}
