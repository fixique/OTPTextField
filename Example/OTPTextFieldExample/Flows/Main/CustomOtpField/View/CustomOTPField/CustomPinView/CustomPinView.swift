//
//  CustomPinView.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 20.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit
import SFOTPTextField

final class CustomPinView: UIView {

    // MARK: - IBOutlets

    @IBOutlet private weak var indicatorView: UIView!
    @IBOutlet private weak var codeLabel: UILabel!

    // MARK: - UIView

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

}

// MARK: - PinContainer

extension CustomPinView: PinContainer {

    func set(value: String?) {
        codeLabel.text = value
    }

    func clear() {
        codeLabel.text = nil
    }

    func setupState(isActive: Bool, isError: Bool) {
        if isActive {
            indicatorView.backgroundColor = Colors.Figma.defaultBlue
        } else {
            let color = isError ? Colors.Figma.defaultRed : Colors.Figma.negativeBackground
            indicatorView.backgroundColor = color
        }
    }

}

// MARK: – Configuration

private extension CustomPinView {

    func setupInitialState() {
        configureContainer()
        configureIndicator()
        configureCodeLabel()
    }

    func configureContainer() {
        backgroundColor = .clear
    }

    func configureIndicator() {
        indicatorView.backgroundColor = Colors.Figma.negativeBackground
    }

    func configureCodeLabel() {
        codeLabel.font = UIFont.systemFont(ofSize: 50, weight: .light)
        codeLabel.textColor = Colors.Figma.defaultText
        codeLabel.text = nil
    }

}
