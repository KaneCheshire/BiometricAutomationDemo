//
//  BiometricsAutomationDemoUITests.swift
//  BiometricsAutomationDemoUITests
//
//  Created by Kane Cheshire on 31/10/2018.
//  Copyright © 2018 kane.codes. All rights reserved.
//

import XCTest

class BiometricsAutomationDemoUITests: XCTestCase {
    
    func test_launchingWithBiometricsDisabled() {
        Biometrics.unenrolled()
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.staticTexts["Biometrics unavailable"].exists)
        XCTAssertFalse(app.buttons["Authenticate"].isEnabled)
    }
    
    func test_launchingWithBiometricsEnabled() {
        Biometrics.enrolled()
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.staticTexts["Biometrics available"].exists)
        XCTAssertTrue(app.buttons["Authenticate"].isEnabled)
        app.buttons["Authenticate"].tap()
        Biometrics.successfulAuthentication()
    }

}
