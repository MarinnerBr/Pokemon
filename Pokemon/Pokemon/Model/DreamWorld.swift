//
//  DreamWorld.swift
//  Pokemon
//
//  Created by Rogerio Martins on 14/03/22.
//

import Foundation

// MARK: - DreamWorld
struct DreamWorld: Codable {
    let frontDefault: String?
    let frontFemale: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }
}
