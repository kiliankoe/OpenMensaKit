//
//  OpenMensaKitTests.swift
//  OpenMensaKit
//
//  Created by Kilian Koeltzsch on 10.07.17.
//  Copyright © 2017 OpenMensaKit. All rights reserved.
//

import Foundation
import XCTest
import OpenMensaKit

class OpenMensaKitTests: XCTestCase {
    func testGetSingleCanteen() {
        let e = expectation(description: "Get a result for a single canteen")

        let alteMensa = 79
        Canteen.get(withID: alteMensa) { result in
            switch result {
            case .failure(let error):
                XCTFail("Failed with error: \(error)")
            case .success(_):
                e.fulfill()
            }
        }

        waitForExpectations(timeout: 5)
    }

    func testGetMultipleCanteens() {
        let e = expectation(description: "Get a result for multiple canteens")

        let dresden = [78,79,80,81,82,83,84,85,86,87,88,89,90,91,92]
        Canteen.get(withIDs: dresden) { result in
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
        ("testGetSingleCanteen", testGetSingleCanteen),
    ]
}
