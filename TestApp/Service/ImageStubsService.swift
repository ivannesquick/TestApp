//
//  ImageStubsService.swift
//  TestApp
//
//  Created by Neskin Ivan on 16.03.2021.
//  Copyright © 2021 Neskin Ivan. All rights reserved.
//

import Foundation

struct ImageStubsService: IImageStub {
    func items() -> [ImageInfo] {
        var item: [ImageInfo] = [
            ImageInfo(url: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Mt-St-Greg-RueEcureuils-3.jpg/1024px-Mt-St-Greg-RueEcureuils-3.jpg"),
            ImageInfo(url: "https://bipbap.ru/wp-content/uploads/2017/04/72fqw2qq3kxh.jpg"),
            ImageInfo(url: "https://avatarko.ru/img/kartinka/33/multfilm_lyagushka_32117.jpg"),
            ImageInfo(url: "https://proprikol.ru/wp-content/uploads/2019/12/privet-krasivye-kartinki-1.jpg"),
            ImageInfo(url: "https://www.krym4you.com/files/catalog/138/gallery/big//chernoe-more_1435752144.jpg"),
            ImageInfo(url: "https://s1.1zoom.ru/big0/283/Ships_Sailing_Sea_Sky_534514_1365x1024.jpg")
        ]
        return item
    }
}
