//
//  Error.swift
//  OpenMensaKit
//
//  Created by Kilian Költzsch on 10.07.17.
//  Copyright © 2017 OpenMensaKit. All rights reserved.
//

import Foundation

enum Error: Swift.Error {
    case network
    case server(statusCode: Int)
}
