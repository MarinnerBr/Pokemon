//
//  GenerationV.swift
//  Pokemon
//
//  Created by Rogerio Martins on 14/03/22.
//

import Foundation

// MARK: - GenerationV
struct GenerationV: Codable {
    let blackWhite: Sprites?

    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
}
