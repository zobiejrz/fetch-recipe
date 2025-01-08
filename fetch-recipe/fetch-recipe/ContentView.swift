//
//  ContentView.swift
//  fetch-recipe
//
//  Created by Ben Zobrist on 1/7/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var viewmodel = ViewModel()

    var body: some View {
        NavigationView {
            List {
                if viewmodel.state == .ready {
                    if viewmodel.recipes.count > 0 {
                        ForEach(viewmodel.recipes) { item in
                            NavigationLink {
                                RecipeDetailView(recipe: item)
                            } label: {
                                Text("\(item.name ?? "No Name")")
                            }
                        }
                    } else {
                        Text("No recipes found, sorry :-(")
                    }
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("Recipes")
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        SettingsView(vm: $viewmodel)
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .task {
                await self.viewmodel.loadRecipes()
            }
            Text("Select an item")
        }
        
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
