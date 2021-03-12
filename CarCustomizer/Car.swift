//
//  Car.swift
//  CarCustomizer
//
//  Created by Freddie Nunn on 09/03/2021.
//

import Foundation

struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func statDisplay() -> String {
        return """
            Make: \(make)
            Model: \(model)
            Top Speed: \(topSpeed) mph
            Acceleration: \(acceleration)s (0-60)
            Handling: \(handling)
            """
            
    }
}
