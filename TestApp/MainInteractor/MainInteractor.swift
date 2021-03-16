//
//  MainInteractor.swift
//  TestApp
//
//  Created by Neskin Ivan on 07.02.2021.
//  Copyright © 2021 Neskin Ivan. All rights reserved.
//

import Foundation

class MainInteractor: IMainInteractor {
    var imageStubs:IImageStub = ImageStubsService()
    var item:[ImageInfo] = []
    
    func items() -> [ImageInfo] {
        item = imageStubs.items()
        return item
    }
    
    func removeItem(index: Int) {
        self.item.remove(at: index)
    }
    
    func refreshAllElements() -> [ImageInfo] {
        item = imageStubs.items()
        return item
    }
    
}
