//
//  Array.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 19.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

extension Array {

    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }

}
