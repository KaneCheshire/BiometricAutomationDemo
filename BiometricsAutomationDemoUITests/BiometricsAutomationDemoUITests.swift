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
	}
	
	func test_successfulAuthentication() {
		Biometrics.enrolled()
		app.launch()
		app.buttons["Authenticate"].tap()
		acceptPermissionsPromptIfRequired()
		Biometrics.successfulAuthentication()
		XCTAssertTrue(app.alerts["Authenticated successfully!"].firstMatch.waitForExistence(timeout: 5))
	}
	
	func test_unsuccessfulAuthentication() {
		Biometrics.enrolled()
		app.launch()
		app.buttons["Authenticate"].tap()
		acceptPermissionsPromptIfRequired()
		Biometrics.unsuccessfulAuthentication()
		// Note: in Xcode 10.1 this will fail because it can't find the cancel button.
		// It isn't an issue in Xcode 10 or Xcode 10.2.
		// You can also work around the issue in Xcode 10.1 by virtually pressing the home button:
		// XCUIDevice.shared.press(.home)
		let cancelButton = springboard.alerts.buttons["Cancel"].firstMatch
		XCTAssertTrue(cancelButton.waitForExistence(timeout: 5))
		cancelButton.tap()
		XCTAssertTrue(app.alerts["Authentication failed."].firstMatch.waitForExistence(timeout: 5))
	}
	
	// Face ID asks the user for permission the first time you try to authenticate. Touch ID doesn't.
	private func acceptPermissionsPromptIfRequired() {
		let permissionsOkayButton = springboard.alerts.buttons["OK"].firstMatch
		if permissionsOkayButton.exists {
			permissionsOkayButton.tap()
		}
	}
	
}
