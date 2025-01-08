//
//  RecipeDetailView.swift
//  fetch-recipe
//
//  Created by Ben Zobrist on 1/7/25.
//

import SwiftUI

struct RecipeDetailView: View {
    
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                
                Text("\(recipe.cuisine) cuisine")
                    .font(.subheadline)
                
                CachedImage(uuid: recipe.uuid, url: URL(string: recipe.photo_url_large!))
                    .padding()
                
                Divider()
                
                if let source_url = recipe.source_url {
                    Link(destination: URL(string: source_url)!) {
                        Text("Source URL ") + Text(Image(systemName: "link"))
                    }
                }
                
                if let youtube_url = recipe.youtube_url {
                    Link(destination: URL(string: youtube_url)!) {
                        Text("YouTube URL ") + Text(Image(systemName: "link"))
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle(recipe.name)
        }
    }
}

#Preview {
    NavigationView {
        RecipeDetailView(recipe:
                            Recipe(
                                cuisine: "Malaysian",
                                name: "Apam Balik",
                                photo_url_large: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
                                photo_url_small: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
                                uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
                                source_url: nil,
                                youtube_url: "https://www.youtube.com/watch?v=6R8ffRRJcrg"
                            )
        )
    }
}
