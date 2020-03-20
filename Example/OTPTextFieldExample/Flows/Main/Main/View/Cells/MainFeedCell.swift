//
//  MainFeedCell.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 20.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit
import ReactiveDataDisplayManager

final class MainFeedCell: UITableViewCell, Configurable {

    // MARK: - IBOutlets

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var arrowImageView: UIImageView!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        UIView.animate(withDuration: 0.3) {
            self.containerView.backgroundColor = highlighted
                    ? Colors.Figma.negativeBackground.withAlphaComponent(0.6)
                    : Colors.Figma.negativeBackground
        }
    }

    // MARK: - Configurable

    func configure(with model: String) {
        nameLabel.text = model
    }

}

// MARK: - Configuration

private extension MainFeedCell {

    func setupInitialState() {
        configureContainer()
        configureNameLabel()
        configureArrowImageView()
    }

    func configureContainer() {
        selectionStyle = .none
        contentView.backgroundColor = Colors.Figma.defaultBackground
        containerView.backgroundColor = Colors.Figma.negativeBackground
        containerView.layer.cornerRadius = 5.0
        containerView.layer.masksToBounds = true
    }

    func configureNameLabel() {
        nameLabel.textColor = Colors.Figma.defaultText
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        nameLabel.text = nil
    }

    func configureArrowImageView() {
        arrowImageView.contentMode = .scaleAspectFill
        arrowImageView.image = UIImage(asset: Asset.iconArrowRight)
    }

}
