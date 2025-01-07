//
//  fetch_recipeApp.swift
//  fetch-recipe
//
//  Created by Ben Zobrist on 1/7/25.
//

import SwiftUI

@main
struct fetch_recipeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
