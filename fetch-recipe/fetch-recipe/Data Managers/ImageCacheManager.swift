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
    
    private(set) var numStored = 0
    
    private init(){
        
    }
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage> ()
        
        // TODO: non-zero values to actually provide benefits to caching
        cache.countLimit = 0
        cache.totalCostLimit = 0
        
        return cache
    }()
    
    @discardableResult func add(image: UIImage, key: String) -> String {
        imageCache.setObject(image, forKey: key as NSString)
        numStored += 1
        return "ADDED TO CACHE"
    }
    
    func get(key: String) -> UIImage? {
        guard let image = imageCache.object(forKey: key as NSString) else {
            return nil
        }
        return image
    }
    
    @discardableResult func remove(key: String) -> String {
        imageCache.removeObject(forKey: key as NSString)
        numStored -= 1
        return "REMOVE FROM CACHE"
    }
    
    @discardableResult func removeAll() -> String {
        imageCache.removeAllObjects()
        numStored = 0
        return "REMOVED ALL FROM CACHE"
    }
}
