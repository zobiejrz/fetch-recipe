//
//  ImageCacheManager.swift
//  fetch-recipe
//
//  Created by Ben Zobrist on 1/7/25.
//

import Foundation
import SwiftUI

class ImageCacheManager{
    
    static let instance = ImageCacheManager()
    
    private init(){
        
    }
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage> ()
        
        // TODO: non-zero values to actually provide benefits to caching
        cache.countLimit = 0
        cache.totalCostLimit = 0
        
        return cache
    }()
    
    @discardableResult func add(image: UIImage, uuid: String) -> String {
        imageCache.setObject(image, forKey: uuid as NSString)
        return "ADDED TO CACHE"
    }
    
    func get(uuid: String) -> UIImage? {
        guard let image = imageCache.object(forKey: uuid as NSString) else {
            return nil
        }
        return image
    }
    
    @discardableResult func remove(uuid: String) -> String {
        imageCache.removeObject(forKey: uuid as NSString)
        return "REMOVE FROM CACHE"
    }
}
