//
//  RecipeListItemView.swift
//  fetch-recipe
//
//  Created by Ben Zobrist on 1/7/25.
//

import SwiftUI

struct RecipeListItemView: View {
    
    let recipe: Recipe
    
    var body: some View {
        HStack {
            CachedImage(key: "sml-\(recipe.uuid!)", url: URL(string: recipe.photo_url_small!))
                .frame(width: 50.0)
                .cornerRadius(15)

            Text(displayName)
                .font(.title2)
            
            Spacer()
        }
        
    }
    
    private var displayName: String {
        let str = recipe.name ?? "No Name"
        if str.count > 16 {
            return "\(str.prefix(13))..."
        }
        return str
    }
}

#Preview {
    List {
        
        RecipeListItemView(recipe: Recipe(cuisine: nil, name: "Mediterranean Chopped Salad", photo_url_large: nil, photo_url_small: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/2cac06b3-002e-4df7-bb08-e15bbc7e552d/small.jpg", uuid: "1", source_url: nil, youtube_url: nil))
        RecipeListItemView(recipe: Recipe(cuisine: nil, name: "Bakewell Tart", photo_url_large: nil, photo_url_small: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/2cac06b3-002e-4df7-bb08-e15bbc7e552d/small.jpg", uuid: "2", source_url: nil, youtube_url: nil))
        RecipeListItemView(recipe: Recipe(cuisine: nil, name: "Turkey and Avacado Wrap", photo_url_large: nil, photo_url_small: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/2cac06b3-002e-4df7-bb08-e15bbc7e552d/small.jpg", uuid: "3", source_url: nil, youtube_url: nil))
        RecipeListItemView(recipe: Recipe(cuisine: nil, name: nil, photo_url_large: nil, photo_url_small: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/2cac06b3-002e-4df7-bb08-e15bbc7e552d/small.jpg", uuid: "4", source_url: nil, youtube_url: nil))
        RecipeListItemView(recipe: Recipe(cuisine: nil, name: "Cucumber Apple Salad", photo_url_large: nil, photo_url_small: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/2cac06b3-002e-4df7-bb08-e15bbc7e552d/small.jpg", uuid: "5", source_url: nil, youtube_url: nil))
        
    }
}
