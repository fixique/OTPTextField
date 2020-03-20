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
        let (view, output) = MainModuleConfigurator().configure()
        output.onOpenOTP = { [weak self] type in
            self?.handleOpeningOtp(with: type)
        }
        router.setRootModule(view)
    }

    func showDefaultOtpScreen() {
        let (view, _) = DefaultOtpFieldModuleConfigurator().configure()
        router.push(view)
    }

}

// MARK: - Help Methods

private extension MainCoordinator {

    func handleOpeningOtp(with type: OTPFieldType) {
        switch type {
        case .default:
            showDefaultOtpScreen()
        case .round:
            break
        case .custom:
            break
        }
    }

}
