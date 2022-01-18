//
//  TimerTests.swift
//  TimerTests
//
//  Created by Arman Abkar on 1/7/22.
//

import XCTest
import SwiftUI
@testable import Timer

class TimerTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testCanInit() throws {
        _ = try makeSUT()
    }

    private func makeSUT() throws -> some App {
        let app = TimerApp()
        XCTAssertNotNil(app)
        XCTAssertNotNil(app.body)
        return app
    }

}
