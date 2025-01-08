//
//  CachedImage.swift
//  fetch-recipe
//
//  Created by Ben Zobrist on 1/8/25.
//

import SwiftUI

struct CachedImage: View {
    let uuid: String
    let url: URL?
    
    var body: some View {
        if let img = ImageCacheManager.instance.get(uuid: uuid) {
            Image(uiImage: img)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .border(.green)
        } else if let url = url {
            AsyncImage(url: url) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .onAppear {
                            let _  = ImageCacheManager.instance.add(image: ImageRenderer(content: image).uiImage!, uuid: uuid)
                        }
                } else if phase.error != nil {
                    Image(systemName: "xmark.octagon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.red)
                } else {
                    Image(systemName: "xmark.octagon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.yellow)
                }
            }
            
            
        } else {
            Image(systemName: "xmark.octagon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
        }
        
    }
    
}

//#Preview {
//    CacheImage()
//}
