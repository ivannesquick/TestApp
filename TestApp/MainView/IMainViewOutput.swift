//
//  IMainViewOutput.swift
//  TestApp
//
//  Created by Neskin Ivan on 07.02.2021.
//  Copyright © 2021 Neskin Ivan. All rights reserved.
//

import Foundation

protocol IMainViewOutput {
    var router: IMainRouter? { get set }
    func viewDidLoad() -> [ImageInfo]
    func removeItem(indexPath: IndexPath)
    func refreshItems()
}
