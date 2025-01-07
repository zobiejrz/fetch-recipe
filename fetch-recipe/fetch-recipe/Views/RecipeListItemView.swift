//
//  RecipeListItemView.swift
//  fetch-recipe
//
//  Created by Ben Zobrist on 1/7/25.
//

import SwiftUI

struct RecipeListItemView: View {
    
    let recipeName: String?
    
    var body: some View {
        HStack {
            Text(displayName)
                .font(.title2)
            Spacer()
            Image(systemName: "note")
        }
        
    }
    
    private var displayName: String {
        let str = recipeName ?? "Unnamed Recipe"
        if str.count > 16 {
            return "\(str.prefix(13))..."
        }
        return str
    }
}

#Preview {
    List {
        RecipeListItemView(recipeName: "Mediterranean Chopped Salad")
        RecipeListItemView(recipeName: "Bakewell Tart")
        RecipeListItemView(recipeName: "Turkey and Avacado Wrap")
        RecipeListItemView(recipeName: nil)
        RecipeListItemView(recipeName: "Cucumber Apple Salad")
        
    }
}
