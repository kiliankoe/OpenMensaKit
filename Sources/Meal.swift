//
//  Meal.swift
//  OpenMensaKit
//
//  Created by Kilian Költzsch on 10.07.17.
//  Copyright © 2017 OpenMensaKit. All rights reserved.
//

import Foundation

/// Something to eat.
public struct Meal: Codable {
    /// Distinct ID.
    public let id: Int
    /// Name.
    public let name: String
    /// Category.
    public let category: String
    /// A meal's cost
    public let price: Price
    /// Additional notes.
    public let notes: [String]
}

extension Meal {
    /// A meal's cost.
    public struct Price: Codable {
        public let students: Double
        public let employees: Double
        public let pupils: Double
        public let others: Double
    }
}
