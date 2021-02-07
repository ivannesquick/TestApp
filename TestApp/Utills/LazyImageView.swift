//
//  LazyImageView.swift
//  TestApp
//
//  Created by Neskin Ivan on 03.02.2021.
//  Copyright © 2021 Neskin Ivan. All rights reserved.
//

import UIKit

class LazyImageView: UIImageView {
    
    private let imageCache = NSCache<NSString, UIImage>()
     
    func loadImage(fromURL imageURL: ImageInfo) {
        
        if let cachedImage = self.imageCache.object(forKey: imageURL.url as NSString) {
            debugPrint("image loaded from cache ")
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            guard let url = URL(string: imageURL.url) else { return }
            if let imageData = try? Data(contentsOf: url) {
                
                debugPrint("Image download from network")
                
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.imageCache.setObject(image, forKey: imageURL.url as NSString)
                        self.image = image
                    }
                }
            }
        }
    }
}
