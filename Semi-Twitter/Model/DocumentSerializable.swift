//
//  DocumentSerializable.swift
//  Rhythms
//
//  Created by Aria Zare on 2/22/21.
//

import Foundation

protocol DocumentSerializable {
    init?(dictionary: [String: Any])
}
