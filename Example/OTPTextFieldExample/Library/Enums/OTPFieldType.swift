//
//  OTPFieldType.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 20.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

enum OTPFieldType: CaseIterable {
    case `default`
    case round
    case custom

    var title: String {
        switch self {
        case .default:
            return L10n.OTPFieldType.Default.title
        case .round:
            return L10n.OTPFieldType.Round.title
        case .custom:
            return L10n.OTPFieldType.Custom.title
        }
    }

    var description: String {
        switch self {
        case .default:
            return L10n.OTPFieldType.Default.description(password)
        case .round:
            return L10n.OTPFieldType.Round.description(password)
        case .custom:
            return L10n.OTPFieldType.Custom.title
        }
    }

    var password: String {
        switch self {
        case .default:
            return "1234"
        case .round:
            return "123456"
        case .custom:
            return "1234"
        }
    }
}
