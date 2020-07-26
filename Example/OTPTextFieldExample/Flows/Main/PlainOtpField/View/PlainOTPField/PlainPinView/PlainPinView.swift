//
//  PlainPinView.swift
//  OTPTextFieldExample
//
//  Created by Александр Чаусов on 25/07/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit
import SFOTPTextField

final class PlainPinView: UIView {

    // MARK: - IBOutlets

    @IBOutlet private weak var codeLabel: UILabel!
    @IBOutlet private weak var placeholderView: UIView!
    @IBOutlet private weak var indicatorView: UIView!

    // MARK: - UIView

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

}

// MARK: - PinContainer

extension PlainPinView: PinContainer {

    func set(value: String?) {
        codeLabel.text = value
        placeholderView.isHidden = true
    }

    func clear() {
        codeLabel.text = nil
        placeholderView.isHidden = false
    }

    func setupState(isActive: Bool, isError: Bool) {
        if isActive && indicatorView.isHidden {
            startIndicatorAnimation()
        } else if !isActive {
            stopIndicatorAnimation()
        }
        let color = isError ? Colors.Figma.defaultRed : Colors.Figma.negativeBackground
        placeholderView.backgroundColor = color
    }

}

// MARK: – Configuration

private extension PlainPinView {

    func setupInitialState() {
        configureCodeLabel()
        configureIndicatorView()
        configurePlaceholderView()
    }

    func configureCodeLabel() {
        codeLabel.text = nil
        codeLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        codeLabel.textColor = Colors.Figma.defaultText
    }

    func configureIndicatorView() {
        indicatorView.backgroundColor = Colors.Figma.defaultBlue
        indicatorView.layer.cornerRadius = 1
        indicatorView.isHidden = true
    }

    func configurePlaceholderView() {
        placeholderView.backgroundColor = Colors.Figma.negativeBackground
        placeholderView.layer.cornerRadius = placeholderView.bounds.height / 2
    }

}

// MARK: - Animation

private extension PlainPinView {

    func startIndicatorAnimation() {
        let appearAnimation = CABasicAnimation(keyPath: "opacity")
        appearAnimation.fromValue = 0.0
        appearAnimation.toValue = 1.0
        appearAnimation.duration = 0.5
        appearAnimation.timingFunction = CAMediaTimingFunction(name: .easeIn)

        let disappearAnimation = CABasicAnimation(keyPath: "opacity")
        disappearAnimation.fromValue = 1.0
        disappearAnimation.toValue = 0.0
        disappearAnimation.duration = 0.5
        disappearAnimation.timingFunction = CAMediaTimingFunction(name: .easeIn)

        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [appearAnimation, disappearAnimation]
        animationGroup.duration = 1
        animationGroup.repeatCount = .infinity

        indicatorView.isHidden = false
        indicatorView.layer.add(animationGroup, forKey: "fade")
    }

    func stopIndicatorAnimation() {
        indicatorView.isHidden = true
        indicatorView.layer.removeAllAnimations()
    }

}
