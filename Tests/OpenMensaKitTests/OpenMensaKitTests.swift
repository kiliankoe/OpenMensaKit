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
    
    static var allTests = [
        ("testGetSingleCanteen", testGetSingleCanteen),
    ]
}
