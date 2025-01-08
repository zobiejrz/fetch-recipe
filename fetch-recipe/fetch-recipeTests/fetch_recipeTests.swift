//
//  fetch_recipeTests.swift
//  fetch-recipeTests
//
//  Created by Ben Zobrist on 1/7/25.
//

import Testing
import Foundation
import UIKit
@testable import fetch_recipe

struct fetch_recipeTests {
    
    @Test func testAddToCache() async throws {
        ImageCacheManager.instance.removeAll()
        #expect(ImageCacheManager.instance.numStored == 0, "ImageCacheManager needs to start empty")
        
        let tmp = UIImage(systemName: "swift")!
        let res = ImageCacheManager.instance.add(image: tmp, key: "1")
        
        #expect(res == "ADDED TO CACHE", "Got \(res), expected 'ADDED TO CACHE'")
        #expect(ImageCacheManager.instance.numStored == 1, "Only one image should be cached")
        
        ImageCacheManager.instance.removeAll()
    }
    
    @Test func testGetFromCache() async throws {
        ImageCacheManager.instance.removeAll()
        #expect(ImageCacheManager.instance.numStored == 0, "ImageCacheManager needs to start empty")
        
        let input = UIImage(systemName: "swift")!
        var res = ImageCacheManager.instance.add(image: input, key: "1")
        
        #expect(res == "ADDED TO CACHE", "Got \(res), expected 'ADDED TO CACHE'")
        #expect(ImageCacheManager.instance.numStored == 1, "Only one image should be cached")
        
        let output = ImageCacheManager.instance.get(key: "1")
        
        #expect(output == input, "Didn't get the same image back as was cached")
        ImageCacheManager.instance.removeAll()
    }
    
    @Test func testRemoveFromCache() async throws {
        ImageCacheManager.instance.removeAll()
        #expect(ImageCacheManager.instance.numStored == 0, "ImageCacheManager needs to start empty")
        
        let input = UIImage(systemName: "swift")!
        var res = ImageCacheManager.instance.add(image: input, key: "1")
        
        #expect(res == "ADDED TO CACHE", "Got \(res), expected 'ADDED TO CACHE'")
        #expect(ImageCacheManager.instance.numStored == 1, "Only one image should be cached")
        
        let output = ImageCacheManager.instance.get(key: "1")
        
        #expect(output == input, "Didn't get the same image back as was cached")
        
        res = ImageCacheManager.instance.remove(key: "1")
        
        #expect(res == "REMOVE FROM CACHE", "Got \(res), expected 'REMOVE FROM CACHE'")
        #expect(ImageCacheManager.instance.numStored == 0, "No images should be cached")
    }
}
