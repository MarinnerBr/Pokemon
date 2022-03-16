//
//  Move.swift
//  Pokemon
//
//  Created by Rogerio Martins on 14/03/22.
//

import Foundation

// MARK: - Move
struct Move: Codable {
    let move: Species?
    let versionGroupDetails: [VersionGroupDetail]?

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}
