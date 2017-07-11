//
//  MealTests.swift
//  OpenMensaKit
//
//  Created by Kilian Költzsch on 11.07.17.
//  Copyright © 2017 OpenMensaKit. All rights reserved.
//

import Foundation
import XCTest
import OpenMensaKit

class MealTests: XCTestCase {
    func testGetMeals() {
        let e = expectation(description: "Get a result for a days meals")

        let alteMensa = 79
        Meal.get(forCanteen: alteMensa, onDay: Date()) { result in
            switch result {
            case .failure(let error):
                XCTFail("Failed with error: \(error)")
            case .success(_):
                e.fulfill()
            }
        }

        waitForExpectations(timeout: 5)
    }

    static var allTests = [
        ("testGetMeals", testGetMeals)
    ]
}
