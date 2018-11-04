//
//  BiometricsAutomationDemoUITests.swift
//  BiometricsAutomationDemoUITests
//
//  Created by Kane Cheshire on 31/10/2018.
//  Copyright © 2018 kane.codes. All rights reserved.
//

import XCTest

class BiometricsAutomationDemoUITests: XCTestCase {
    
    let app = XCUIApplication()
    let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard") // Shows permissions alerts over our app
    
    func test_launchingWithBiometricsDisabled() {
        Biometrics.unenrolled()
        app.launch()
        XCTAssertTrue(app.staticTexts["Biometrics unavailable"].exists)
        XCTAssertFalse(app.buttons["Authenticate"].isEnabled)
    }
    
    func test_launchingWithBiometricsEnabled() {
        Biometrics.enrolled()
        app.launch()
        XCTAssertTrue(app.staticTexts["Biometrics available"].firstMatch.exists)
        XCTAssertTrue(app.buttons["Authenticate"].firstMatch.isEnabled)
        XCTAssertEqual(app.state, .runningForeground)
        app.buttons["Authenticate"].tap()
        let permissionsOkayButton = springboard.alerts.buttons["OK"].firstMatch
        if permissionsOkayButton.exists { // Face ID asks the user for permission the first time you try to authenticate. Touch ID doesn't
            permissionsOkayButton.tap()
        }
        Biometrics.successfulAuthentication()
    }

}
