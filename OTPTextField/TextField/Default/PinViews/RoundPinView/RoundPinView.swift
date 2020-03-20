//
//  RoundPinView.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 19.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

final class RoundPinView: UIView {

    // MARK: - IBOutlets

    @IBOutlet private weak var outerContainerView: UIView!
    @IBOutlet private weak var innerContainerView: UIView!
    @IBOutlet private weak var codeLabel: UILabel!

    // MARK: - UIView

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitilState()
    }

}

// MARK: - Pin Container

extension RoundPinView: PinContainer {

    public func set(value: String?) {
        codeLabel.text = value
    }

    public func clear() {
        codeLabel.text = nil
    }

    public func animateIndicator() {
        setIndicatorActive()
    }

    public func removeIndicator() {
        setIndicatorInactive()
    }

}

// MARK: - Configuration

private extension RoundPinView {

    func setupInitilState() {
        configureContainerViews()
        configureCodeLabel()
    }

    func configureContainerViews() {
        outerContainerView.backgroundColor = UIColor(red: 221 / 255, green: 221 / 255, blue: 221 / 255, alpha: 1.0)
        outerContainerView.layer.cornerRadius = outerContainerView.frame.height / 2
        outerContainerView.layer.masksToBounds = true

        innerContainerView.backgroundColor = UIColor(red: 242 / 255, green: 242 / 255, blue: 242 / 255, alpha: 1.0)
        innerContainerView.layer.cornerRadius = innerContainerView.frame.height / 2
        innerContainerView.layer.masksToBounds = true
    }

    func configureCodeLabel() {
        codeLabel.textColor = UIColor(red: 34 / 255, green: 34 / 255, blue: 34 / 255, alpha: 1.0)
        codeLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        codeLabel.textAlignment = .center
        codeLabel.text = nil
    }

}

// MARK: - Animation

private extension RoundPinView {

    func setIndicatorActive() {
        outerContainerView.backgroundColor = UIColor(red: 212 / 255, green: 0, blue: 0, alpha: 1.0)
    }

    func setIndicatorInactive() {
        outerContainerView.backgroundColor = UIColor(red: 221 / 255, green: 221 / 255, blue: 221 / 255, alpha: 1.0)
    }

}
