//
//  Stat.swift
//  Pokemon
//
//  Created by Rogerio Martins on 14/03/22.
//

import Foundation

// MARK: - Stat
struct Stat: Codable {
    let baseStat, effort: Int?
    let stat: Species?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}
