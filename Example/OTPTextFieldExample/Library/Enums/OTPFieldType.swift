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
    case plain

    var title: String {
        switch self {
        case .default:
            return L10n.OTPFieldType.Default.title
        case .round:
            return L10n.OTPFieldType.Round.title
        case .custom:
            return L10n.OTPFieldType.Custom.title
        case .plain:
            return L10n.OTPFieldType.Plain.title
        }
    }

    var description: String {
        switch self {
        case .default:
            return L10n.OTPFieldType.Default.description(password)
        case .round:
            return L10n.OTPFieldType.Round.description(password)
        case .custom:
            return L10n.OTPFieldType.Custom.description(password)
        case .plain:
            return L10n.OTPFieldType.Plain.description(password)
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
        case .plain:
            return "123456"
        }
    }
}
