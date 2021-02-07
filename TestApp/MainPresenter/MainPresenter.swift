//
//  MainPresenter.swift
//  TestApp
//
//  Created by Neskin Ivan on 07.02.2021.
//  Copyright © 2021 Neskin Ivan. All rights reserved.
//

import Foundation

class MainPresenter: IMainViewOutput {
    var router: IMainRouter?
    var interactor: IMainInteractor
    weak var view: IMainViewInput?
    var items:[ImageInfo] = []
    private var timer: Timer?
    
    init(interactor: IMainInteractor, router: IMainRouter, view: IMainViewInput) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() -> [ImageInfo] {
        items = interactor.items()
        return items
    }
    
    func removeItem(indexPath: IndexPath) {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { (_) in
            self.items.remove(at: indexPath.row)
            self.view?.reloadData()
        })
    }
    
    func refreshItems() {
        items = interactor.items()
        view?.reloadData()
    }
}
