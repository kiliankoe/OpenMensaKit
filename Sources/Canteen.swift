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

// MARK: - API

extension Canteen {
    public static func get(withID id: Int, session: URLSession = .shared, completion: @escaping (Result<Canteen>) -> Void) {
        let request = URLRequest(url: URL(string: "\(id)", relativeTo: OpenMensa.canteensURL)!)
        Network.dataTask(request: request, session: session, completion: completion)
    }
}
