//
//  MainModuleConfiguratorTests.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import XCTest
@testable import OTPTextFieldExample

final class MainModuleConfiguratorTests: XCTestCase {

    // MARK: - Main tests

    func testDeallocation() {
        assertDeallocation(of: {
            let (view, output) = MainModuleConfigurator().configure()
            return (view, [output])
        })
    }

}
