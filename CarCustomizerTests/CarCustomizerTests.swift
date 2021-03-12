//
//  CarCustomizerTests.swift
//  CarCustomizerTests
//
//  Created by Freddie Nunn on 09/03/2021.
//

import XCTest

class CarCustomizerTests: XCTestCase {

    func testNewCarGivesMeACarWithAllAttributesSet() {
        //arrange
        //act
        let car = Car(make: "ferrari", model: "spyder", topSpeed: 145, acceleration: 8.1, handling: 3)
        //assert
        XCTAssertEqual(car.make, "ferrari")
        XCTAssertEqual(car.model, "spyder")
        XCTAssertEqual(car.topSpeed, 145)
        XCTAssertEqual(car.acceleration, 8.1)
        XCTAssertEqual(car.handling, 3)
        
    }
    
    func testStatDisplayReturnsCorrectString() {
        //arrange
        //act
        let car = Car(make: "ferrari", model: "spyder", topSpeed: 145, acceleration: 8.1, handling: 3)
        let expected = """
            Make: ferrari
            Model: spyder
            Top Speed: 145 mph
            Acceleration: 8.1s (0-60)
            Handling: 3
            """
        //assert
        XCTAssertEqual(car.statDisplay(), expected)
    }

}
