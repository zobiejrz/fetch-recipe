//
//  NetworkManager.swift
//  fetch-recipe
//
//  Created by Ben Zobrist on 1/7/25.
//

import Foundation
import SwiftUI

class NetworkManager {
    static let instance = NetworkManager()
    
    private init() { }
    
    func loadJSONAsync(from url: URL, completion: @escaping ([Recipe], Error?) -> Void) {

        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            if error == nil {
                if let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 {
                        do {
                            if let data = data {
                                let root = try JSONDecoder().decode(Root.self, from: data)
                                completion(root.recipes, error)
                            } else {
                                completion([Recipe](), error)
                            }
                        } catch let parseError {
                            completion([Recipe](), parseError)
                        }
                    }
                }
            } else {
                completion([Recipe](), error)
            }
        }
        
        task.resume()
    }
}
