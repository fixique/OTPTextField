//
//  PlainOtpFieldPresenter.swift
//  OTPTextFieldExample
//
//  Created by Александр Чаусов on 25/07/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

final class PlainOtpFieldPresenter: PlainOtpFieldModuleOutput {

    // MARK: - PlainOtpFieldModuleOutput

    // MARK: - Properties

    weak var view: PlainOtpFieldViewInput?

}

// MARK: - PlainOtpFieldModuleInput

extension PlainOtpFieldPresenter: PlainOtpFieldModuleInput {
}

// MARK: - PlainOtpFieldViewOutput

extension PlainOtpFieldPresenter: PlainOtpFieldViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
