//
//  OpenMensa.swift
//  OpenMensaKit
//
//  Created by Kilian Költzsch on 10.07.17.
//  Copyright © 2017 OpenMensaKit. All rights reserved.
//

import Foundation

enum OpenMensa {
    static let baseURL = URL(string: "https://openmensa.org/api/v2/")!
    static let canteensURL = URL(string: "canteens/", relativeTo: baseURL)!

    static func menuURL(forCanteenID id: Int, onDay day: Date) -> URL {
        return URL(string: "\(id)/days/\(shortISOFormatter.string(from: day))", relativeTo: canteensURL)!
    }

    private static let shortISOFormatter: DateFormatter = {
        let dF = DateFormatter()
        dF.dateFormat = "yyyy-MM-dd"
        return dF
    }()
}
