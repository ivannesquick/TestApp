//
//  MainRouter.swift
//  TestApp
//
//  Created by Neskin Ivan on 07.02.2021.
//  Copyright © 2021 Neskin Ivan. All rights reserved.
//

import Foundation

class MainRouter: IMainRouter {
    var view: IMainViewInput
    
    init(view: IMainViewInput) {
        self.view = view
    }
}
