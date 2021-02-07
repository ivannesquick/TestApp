//
//  ModuleBuilder.swift
//  TestApp
//
//  Created by Neskin Ivan on 07.02.2021.
//  Copyright © 2021 Neskin Ivan. All rights reserved.
//

import UIKit


class ModuleBuilder {
    static func build() -> UIViewController {
        let view = MainViewController()
        let interactor = MainInteractor()
        let router = MainRouter(view: view)
        let presenter = MainPresenter(interactor: interactor, router: router, view: view)
        view.viewOutput = presenter
        presenter.view = view
        return view
    }
}
