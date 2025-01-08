//
//  SettingsStruct.swift
//  fetch-recipe
//
//  Created by Ben Zobrist on 1/8/25.
//

import Foundation

struct Settings {
    enum EndpointChoice: String {
        case all = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        case malformed = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
        case empty = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    }
    
    
    var currentEndpoint: EndpointChoice = .all
}
