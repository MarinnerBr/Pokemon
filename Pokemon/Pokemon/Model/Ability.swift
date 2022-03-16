//
//  Ability.swift
//  Pokemon
//
//  Created by Rogerio Martins on 14/03/22.
//

import Foundation

// MARK: - Ability
struct Ability: Codable {
    let ability: Species?
    let isHidden: Bool?
    let slot: Int?

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}
