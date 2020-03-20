//
//  MainModuleConfigurator.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

final class MainModuleConfigurator {

    func configure() -> (UIViewController, MainModuleOutput) {
        let view = MainViewController()
        let presenter = MainPresenter()

        presenter.view = view
        view.output = presenter
        let navigationController = DefaultNavigationController(rootViewController: view)
        return (navigationController, presenter)
    }

}
