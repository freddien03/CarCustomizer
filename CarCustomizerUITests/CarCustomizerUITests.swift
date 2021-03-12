//
//  CarCustomizerUITests.swift
//  CarCustomizerUITests
//
//  Created by Freddie Nunn on 09/03/2021.
//

import XCTest

class CarCustomizerUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenBoughtTireAndExhaustPackageGodUpgradeIsDisabled() throws {
        //arrange
        let app = XCUIApplication()
        app.launch()
        //act
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Exhaust package [500G]"]/*[[".cells[\"Exhaust package [500G]\"].switches[\"Exhaust package [500G]\"]",".switches[\"Exhaust package [500G]\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Tires package [500G]"]/*[[".cells[\"Tires package [500G]\"].switches[\"Tires package [500G]\"]",".switches[\"Tires package [500G]\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        //assert
        XCTAssertEqual(tablesQuery.switches["God package [2000G]"].isEnabled, false)
    }
    func testWhenGodUpgradeBoughtItCanBeSold() throws {
        //arrange
        let app = XCUIApplication()
        app.launch()
        //act
        
        let tablesQuery = app.tables
        tablesQuery.switches["God package [2000G]"].tap()
        
        //assert
        XCTAssertEqual(tablesQuery.switches["God package [2000G]"].isEnabled, true)
    }
    
    func testSettingsAndMoneyAreSavedWhenCarChanged() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        //act
        
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Exhaust package [500G]"]/*[[".cells[\"Exhaust package [500G]\"].switches[\"Exhaust package [500G]\"]",".switches[\"Exhaust package [500G]\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Next Car"]/*[[".cells[\"Make: ferrari\\nModel: spyder\\nTop Speed: 145 mph\\nAcceleration: 8.1s (0-60)\\nHandling: 3, Next Car\"].buttons[\"Next Car\"]",".buttons[\"Next Car\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Next Car"]/*[[".cells[\"Make: Tesla\\nModel: model S\\nTop Speed: 190 mph\\nAcceleration: 4.3s (0-60)\\nHandling: 6, Next Car\"].buttons[\"Next Car\"]",".buttons[\"Next Car\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Next Car"]/*[[".cells[\"Make: Bhuggati\\nModel: Veron\\nTop Speed: 230 mph\\nAcceleration: 1.9s (0-60)\\nHandling: 2, Next Car\"].buttons[\"Next Car\"]",".buttons[\"Next Car\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Next Car"]/*[[".cells[\"Make: Landrover\\nModel: discovery\\nTop Speed: 130 mph\\nAcceleration: 10.3s (0-60)\\nHandling: 8, Next Car\"].buttons[\"Next Car\"]",".buttons[\"Next Car\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        //arrange
        XCTAssertEqual(tablesQuery/*@START_MENU_TOKEN@*/.switches["Exhaust package [500G]"]/*[[".cells[\"Exhaust package [500G]\"].switches[\"Exhaust package [500G]\"]",".switches[\"Exhaust package [500G]\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isSelected, true)
        //couldn't find the code to check if switch is on or not, isSelected was always false
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
