//
//  CountdownModelTests.swift
//  TimerTests
//
//  Created by Arman Abkar on 1/7/22.
//

import XCTest
@testable import Timer

class CountdownModelTests: XCTestCase {

    let model = CountdownModel()
    
    override func setUpWithError() throws {
        model.counter = 1
        model.duration = 100
        model.selectedSeconds = 100
        model.isRunning = true
    }

    override func tearDownWithError() throws {
        model.resetTimer()
    }
    
    func test_progress() throws {
        XCTAssertEqual(model.progress, 0.01)
    }
    
    func test_timeFormatter() throws {
        XCTAssertEqual(model.timeFormatter, "00:01:39")
    }
    
    func test_completed() throws {
        model.duration = 1
        model.isRunning = false
        
        XCTAssertTrue(model.completed())
    }
    
    func test_updateTimer() throws {
        model.updateTimer(1)
        
        XCTAssertEqual(model.duration, 100)
    }
    
    func test_resetTimer() throws {
        model.resetTimer()
        
        XCTAssertFalse(model.isRunning)
        XCTAssertEqual(model.duration, model.storedDuration)
        XCTAssertEqual(model.counter, 0)
        XCTAssertEqual(model.selectedHours, 0)
        XCTAssertEqual(model.selectedMinutes, 0)
        XCTAssertEqual(model.selectedSeconds, 0)
    }
    
    func test_receiveTimerUpdate() throws {
        model.receiveTimerUpdate()
        
        XCTAssertEqual(model.counter, 2)
    }

    func test_disabledAction() throws {
        model.duration = 0.1
        
        XCTAssertTrue(model.disabledAction())
    }
    
    func test_playPauseAction() throws {
        model.isRunning = false

        model.playPauseAction()
        
        XCTAssertTrue(model.isRunning)
    }

}
