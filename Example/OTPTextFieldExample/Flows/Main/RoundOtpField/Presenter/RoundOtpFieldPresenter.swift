//
//  RoundOtpFieldPresenter.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

final class RoundOtpFieldPresenter: RoundOtpFieldModuleOutput {

    // MARK: - RoundOtpFieldModuleOutput

    // MARK: - Properties

    weak var view: RoundOtpFieldViewInput?

}

// MARK: - RoundOtpFieldModuleInput

extension RoundOtpFieldPresenter: RoundOtpFieldModuleInput {
}

// MARK: - RoundOtpFieldViewOutput

extension RoundOtpFieldPresenter: RoundOtpFieldViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
