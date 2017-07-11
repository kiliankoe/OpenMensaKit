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
    /// Unique ID.
    public let id: Int
    /// Name.
    public let name: String
    /// Category.
    public let category: String
    /// A meal's cost
    public let price: Price
    /// Additional notes.
    public let notes: [String]

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case category
        case price = "prices"
        case notes
    }
}

extension Meal: Comparable {
    public static func <(lhs: Meal, rhs: Meal) -> Bool {
        return lhs.id < rhs.id
    }

    public static func ==(lhs: Meal, rhs: Meal) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Meal: Hashable {
    public var hashValue: Int {
        return self.id.hashValue
    }
}

extension Meal {
    /// A meal's cost.
    public struct Price: Codable {
        public let students: Double?
        public let employees: Double?
        public let pupils: Double?
        public let others: Double?
    }
}

extension Meal.Price: Equatable {
    public static func ==(lhs: Meal.Price, rhs: Meal.Price) -> Bool {
        return
            lhs.students == rhs.students &&
            lhs.employees == rhs.employees &&
            lhs.pupils == rhs.pupils &&
            lhs.others == rhs.others
    }
}

extension Meal: CustomStringConvertible {
    public var description: String {
        return "\(self.category): \(self.name) \(self.price)"
    }
}

extension Meal.Price: CustomStringConvertible {
    public var description: String {
        return [self.students, self.employees, self.pupils, self.others]
            .flatMap { $0 }
            .map { "\($0)€" }
            .joined(separator: " ")
    }
}

// MARK: - API

extension Meal {
    /// Get a list of meals served at a specific canteen on a given day.
    ///
    /// - Parameters:
    ///   - canteenID: the canteen serving the meals
    ///   - day: date, defaults to today
    ///   - session: URLSession, defaults to .shared
    ///   - completion: handler
    public static func get(forCanteen canteenID: Int, onDay day: Date = Date(), session: URLSession = .shared, completion: @escaping (Result<[Meal]>) -> Void) {
        let request = URLRequest(url: OpenMensa.menuURL(forCanteenID: canteenID, onDay: day))
        Network.dataTask(request: request, session: session, completion: completion)
    }
}
