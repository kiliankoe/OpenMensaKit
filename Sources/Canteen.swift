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
    /// Distinct ID.
    public let id: Int
    /// Name.
    public let name: String
    /// City where the canteen is located.
    public let city: String
    /// Address.
    public let address: String
    private let coordinates: [Double]
    /// Actual location.
    public var coordinate: CLLocationCoordinate2D {
        guard self.coordinates.count == 2 else {
            print("Canteen has no associated coordinate.")
            return CLLocationCoordinate2D()
        }
        return CLLocationCoordinate2D(latitude: self.coordinates[0], longitude: self.coordinates[1])
    }
}
