//
//  MainCoordinator.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

final class MainCoordinator: BaseCoordinator, MainCoordinatorOutput {

    // MARK: - MainCoordinatorOutput

    // MARK: - Private Properties

    private let router = MainRouter()

    // MARK: - Coordinator

    override func start() {
        showModule()
    }

}

// MARK: - Private Methods

private extension MainCoordinator {

    func showModule() {
        let (view, _) = MainModuleConfigurator().configure()
        router.setRootModule(view)
    }

}
