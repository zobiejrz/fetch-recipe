//
//  RecipesViewModel.swift
//  fetch-recipe
//
//  Created by Ben Zobrist on 1/7/25.
//

import Foundation
import SwiftUI

extension ContentView {
    
    enum ViewModelStates { case ready, loading }
    
    @Observable
    class ViewModel {
        private(set) var recipes = [Recipe]()
        private(set) var state:ViewModelStates
        
        init() {
            self.recipes = []
            self.state = .ready
        }
        
        func loadRecipes() async {
            let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
            
            if self.state == .ready {
                self.state = .loading
                NetworkManager.instance.loadJSONAsync(from: url) { (recipes, error) in
                    if let error {
                        print(error)
                    }
                    
                    self.recipes = recipes
                    self.state = .ready
                }
            }
        }
        
    }
}
