//
//  SettingsView.swift
//  fetch-recipe
//
//  Created by Ben Zobrist on 1/7/25.
//

import SwiftUI

struct SettingsView: View {
    @Binding var vm: ContentView.ViewModel
    
    @State private var numCached = ImageCacheManager.instance.numStored
    
    var body: some View {
        Form {
            Section(header:Text("Recipe Data"), footer: Text("\(numCached) images cached")) {
                Picker("Current Endpoint", selection: $vm.settings.currentEndpoint) {
                    Text("All Recipes").tag(Settings.EndpointChoice.all)
                    Text("Malformed Data").tag(Settings.EndpointChoice.malformed)
                    Text("Empty Data").tag(Settings.EndpointChoice.empty)
                }
                Button("Empty Caches", systemImage: "delete.right") {
                    vm.emptyCaches()
                    numCached = 0
                }.foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    NavigationView {
        SettingsView(vm: .constant(ContentView.ViewModel()))
            .navigationTitle("Settings")
    }
}
