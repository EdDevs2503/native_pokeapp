//
//  PokemonsData.swift
//  pokeapp
//
//  Created by Edisson Mata on 23/8/23.
//

import Foundation

struct ListItem: Codable {
    let name: String
    let url: String
}

struct MoveData: Codable {
    let name: String
    let id: Int
    let type: String
    let pp: Int?
    let power: Int?
    let accuracy: Int?
    let learnedAt: Int
}

struct AbilityData: Codable, Identifiable {
    let id: Int
    let name: String
    let effect: String?
}

struct StatsData: Codable {
    let hp: Int
    let attack: Int
    let defense: Int
    let special_attack: Int
    let special_defense: Int
    let speed: Int
}

struct SpecieData: Codable {
    let capture_rate: Int
    let femaleRate: Int
    let generation: String
    let habitat: String?
    let hatch: Int?
    let eggGroups: [String]
}

struct SpritesData: Codable {
    let front_default: String?
    let front_shiny: String?
}

struct EvolutionsDetailsData: Codable {
    let gender: Int?
    let held_item: ListItem?
    let item: ListItem?
    let known_move: ListItem?
    let known_move_type: ListItem?
    let location: ListItem?
    let min_affection: Int?
    let min_beauty: Int?
    let min_happiness: Int?
    let min_level: Int?
    let needs_overworld_rain: Bool?
    let party_species: ListItem?
    let party_type: ListItem?
    let relative_physical_stats: Int?
    let time_of_day: String
    let trade_species: ListItem?
    let trigger: ListItem?
    let turn_upside_down: Bool
}

struct EvolutionsData: Codable {
    let name: String
    let index: Int
    let evolutionsDetails: EvolutionsDetailsData?
}

struct PokemonData: Codable {
    let abilities: [AbilityData]
    let base_experience: Int?
    let height: Int
    let moves: [MoveData]
    let name: String
    let id: Int
    let displayName: String
    let order: Int
    let stats: StatsData
    let types: [String]
    let weight: Int
    let description: String?
    let specie: SpecieData
    let sprites: SpritesData
    let evolutions: [EvolutionsData]
}

struct PokemonsData: Codable {
    let pokemons: [PokemonData]
}
