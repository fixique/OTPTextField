//
//  DefaultNavigationController.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 20.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

/// Base navigation controller into the application
public class DefaultNavigationController: UINavigationController {

    // MARK: - UIViewController

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

}

// MARK: - UINavigationControllerDelegate

extension DefaultNavigationController: UINavigationControllerDelegate {

    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // removing "Back" word from back navigation bar button
        navigationController.topViewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

}
