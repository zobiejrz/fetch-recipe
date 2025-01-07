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

//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
    
    @State var viewmodel = ViewModel()

    var body: some View {
        NavigationView {
            List {
                if viewmodel.state == .ready {
                    ForEach(viewmodel.recipes) { item in
                        NavigationLink {
                            RecipeDetailView(recipe: item)
                        } label: {
                            Text("\(item.name)")
                        }
                    }
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("Recipes")
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        SettingsView()
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
