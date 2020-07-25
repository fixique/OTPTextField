//
//  DefaultPinView.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 19.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

public final class DefaultPinView: UIView {

    // MARK: - IBOutlets

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var codeLabel: UILabel!
    @IBOutlet private weak var indicatorView: UIView!

    // MARK: - UIView

    override public func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

}

// MARK: - Pin Container

extension DefaultPinView: PinContainer {

    public func set(value: String?) {
        codeLabel.text = value
    }

    public func clear() {
        codeLabel.text = nil
    }

    public func setupState(isActive: Bool, isError: Bool) {
        if isActive && indicatorView.isHidden {
            startIndicatorAnimation()
        } else if !isActive {
            stopIndicatorAnimation()
        }
    }

}

// MARK: - Configuration

private extension DefaultPinView {

    func setupInitialState() {
        configureContainerView()
        configureCodeLabel()
        configureIndicatorView()
    }

    func configureContainerView() {
        containerView.backgroundColor = UIColor(red: 246 / 255, green: 246 / 255, blue: 246 / 255, alpha: 1.0)
        containerView.layer.cornerRadius = 2.0
        containerView.layer.masksToBounds = true
    }

    func configureCodeLabel() {
        codeLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        codeLabel.textColor = UIColor.black
        codeLabel.textAlignment = .center
        codeLabel.text = nil
    }

    func configureIndicatorView() {
        indicatorView.backgroundColor = UIColor(red: 212 / 255, green: 0, blue: 0, alpha: 1.0)
        indicatorView.isHidden = true
    }

}

// MARK: - Animation

private extension DefaultPinView {

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
