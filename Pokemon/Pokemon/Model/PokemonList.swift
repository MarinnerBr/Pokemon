//
//  PokemonList.swift
//  Pokemon
//
//  Created by Rogerio Martins on 14/03/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pokemonList = try? newJSONDecoder().decode(PokemonList.self, from: jsonData)

import Foundation

// MARK: - PokemonList
struct PokemonList: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Result]?
}
