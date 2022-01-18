//
//  TimerUITests.swift
//  TimerUITests
//
//  Created by Arman Abkar on 1/12/22.
//

import XCTest

class TimerUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
    }
    
    func test_general() throws {
        XCUIApplication().launch()
        let app = XCUIApplication().windows["Timer"]
        app.children(matching: .popUpButton).matching(identifier: "0").element(boundBy: 2).click()
        app.menuItems["1"].click()
        app.buttons["Volume Lowest"].click()
        app.buttons["Start"].click()
        sleep(2)
        app.buttons["Reset"].click()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
}
