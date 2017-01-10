//
//  TestdoUITests.swift
//  TestdoUITests
//
//  Created by Ryan Poolos on 1/10/17.
//  Copyright © 2017 Frozen Fire Studios. All rights reserved.
//

import XCTest

class TestdoUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // Make sure we have a few rows
        app.buttons["Add"].tap()
        app.buttons["Add"].tap()
        app.buttons["Add"].tap()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAdd() {
        let beforeCells = app.tables.cells.count
        
        app.buttons["Add"].tap()
        
        let afterCells = app.tables.cells.count
        
        XCTAssertGreaterThan(afterCells, beforeCells)
    }
    
    func testDetail() {
        let cell = app.tables.cells.element(boundBy: 0)
        let title = cell.title
        cell.tap()
        
        let label = app.staticTexts[title]
        
        XCTAssert(label.exists)
    }
    
    func testSwipeToDelete() {
        let beforeCells = app.tables.cells.count
        
        let cell = app.tables.cells.element(boundBy: 0)
        cell.swipeLeft()
        cell.buttons["Delete"].tap()
        
        let afterCells = app.tables.cells.count
        
        XCTAssertLessThan(afterCells, beforeCells)
    }
    
    func testEditDelete() {
        let beforeCells = app.tables.cells.count
        
        app.buttons["Edit"].tap()
        
        let cell = app.tables.cells.element(boundBy: 0)
        
        // Minus Button
        cell.buttons.element(boundBy: 0).tap()
        
        // Delete Button
        cell.buttons["Delete"].tap()
        
        let afterCells = app.tables.cells.count
        
        XCTAssertLessThan(afterCells, beforeCells)
    }
}
