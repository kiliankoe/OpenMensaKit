//
//  Canteen.swift
//  OpenMensaKit
//
//  Created by Kilian Költzsch on 10.07.17.
//  Copyright © 2017 OpenMensaKit. All rights reserved.
//

import Foundation
import CoreLocation

/// A place to eat.
public struct Canteen: Codable {
    /// Unique ID.
    public let id: Int
    /// Name.
    public let name: String
    /// City where the canteen is located.
    public let city: String
    /// Address.
    public let address: String
    private let coordinates: [Double]?
    /// Actual location.
    public var coordinate: CLLocationCoordinate2D? {
        guard self.coordinates?.count == 2 else { return nil }
        return CLLocationCoordinate2D(latitude: self.coordinates![0], longitude: self.coordinates![1])
    }
}

extension Canteen: Comparable {
    public static func <(lhs: Canteen, rhs: Canteen) -> Bool {
        return lhs.id < rhs.id
    }

    public static func ==(lhs: Canteen, rhs: Canteen) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Canteen: Hashable {
    public var hashValue: Int {
        return self.id.hashValue
    }
}

extension Canteen: CustomStringConvertible {
    public var description: String {
        return "\(self.name) \(self.address)"
    }
}

// MARK: - API

extension Canteen {
    /// Get a single canteen given it's ID.
    ///
    /// - Parameters:
    ///   - id: id
    ///   - session: URLSession, defaults to .shared
    ///   - completion: handler
    public static func get(withID id: Int, session: URLSession = .shared, completion: @escaping (Result<Canteen>) -> Void) {
        let request = URLRequest(url: URL(string: "\(id)", relativeTo: OpenMensa.canteensURL)!)
        Network.dataTask(request: request, session: session, completion: completion)
    }

    /// Get a list of canteens given their IDs.
    ///
    /// - Parameters:
    ///   - ids: ids
    ///   - session: URLSession, defaults to .shared
    ///   - completion: handler
    public static func get(withIDs ids: [Int], session: URLSession = .shared, completion: @escaping (Result<[Canteen]>) -> Void) {
        let ids = ids.map(String.init).joined(separator: ",")
        let request = URLRequest(url: URL(string: "?ids=\(ids)", relativeTo: OpenMensa.canteensURL)!)
        Network.dataTask(request: request, session: session, completion: completion)
    }

    /// Find a list of canteens near a given coordinate.
    ///
    /// - Parameters:
    ///   - location: coordinate to search around
    ///   - distance: optional search radius in kilometers, defaults to 10km
    ///   - session: URLSession, defaults to .shared
    ///   - completion: handler
    public static func find(near location: CLLocationCoordinate2D, distance: Float? = nil, session: URLSession = .shared, completion: @escaping (Result<[Canteen]>) -> Void) {
        var urlSuffix = "?near[lat]=\(location.latitude)&near[lng]=\(location.longitude)"
        if let distance = distance {
            urlSuffix += "&near[dist]=\(distance)"
        }
        let request = URLRequest(url: URL(string: urlSuffix, relativeTo: OpenMensa.canteensURL)!)
        Network.dataTask(request: request, session: session, completion: completion)
    }

    /// Get a list of meals served at this canteen for a given day.
    ///
    /// - Parameters:
    ///   - day: date, defaults to today
    ///   - session: URLSession, defaults to .shared
    ///   - completion: handler
    public func getMeals(forDay day: Date = Date(), session: URLSession = .shared, completion: @escaping (Result<[Meal]>) -> Void) {
        Meal.get(forCanteen: self.id, onDay: day, session: session, completion: completion)
    }
}
