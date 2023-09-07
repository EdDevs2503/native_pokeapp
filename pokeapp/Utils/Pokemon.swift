//
//  Pokemon.swift
//  pokeapp
//
//  Created by Edisson Mata on 28/7/23.
//

import Foundation
import SwiftUI



struct Pokemon: Hashable {
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    enum PokemonGenerations: String {
        case I = "generation-i"
        case II = "generation-ii"
        case III = "generation-iii"
        case IV = "generation-iv"
        case V = "generation-v"
        case VI = "generation-vi"
        case VII = "generation-vii"
        case VIII = "generation-viii"
        case IX = "generation-ix"
        case X = "generation-x"
        case XI = "generation-xi"
        case XII = "generation-xii"
    }
    
    var generation: PokemonGenerations?
    var name: String
    var id: String
    var imageUrl: URL
    var types: [PokemonType]
    var stats: PokemonsStats?
    var description: String?
    var abilities: [AbilityData]?
    var hatch: Int?
    var eggGroups: [String]?
    var femaleRate: Int?
    
    var stepsToHatch: Float? {
        if (hatch != nil && self.generation != nil) {
            switch(self.generation) {
            case .I:
                return 256 * Float(Float(self.hatch!))
            case .II:
                return 256 * Float(self.hatch!)
            case .III:
                return 256 * Float(self.hatch!)
            case .IV:
                return 267.75 * Float(self.hatch!)
            case .V:
                return 257 * Float(self.hatch!)
            case .VI:
                return 257 * Float(self.hatch!)
            case .VII:
                return 256 * Float(self.hatch!)
            case .VIII:
                return 256 * Float(self.hatch!)
            case .IX:
                return 128 * Float(self.hatch!)
            case .X:
                return 128 * Float(self.hatch!)
            case .XI:
                return 128 * Float(self.hatch!)
            case .XII:
                return 128 * Float(self.hatch!)
            case .none:
                return nil
            }
        } else {
            return nil
        }
    }
    
    init(name: String, id: String, imageUrl: URL, types: [PokemonType], stats: PokemonsStats? = nil, description: String? = nil) {
        self.name = name
        self.id = id
        self.imageUrl = imageUrl
        self.types = types
        self.stats = stats
        self.description = description
    }
    
    init(data: PokemonData) {
        
        let types = data.types.map { PokemonType(typeName: PokemonTypeNames(rawValue: $0) ?? .Normal) }
        
        self.name = data.displayName
        self.id = String(data.id)
        self.imageUrl = URL(string: data.sprites.front_default ?? "https://fakemonday.woodenplankstudios.com/wp-content/uploads/2022/10/pokemon_placeholder.jpg")!
        self.types = types
        self.stats = PokemonsStats(data.stats)
        self.description = data.description?.replacingOccurrences(of: "\n", with: " ", options: .literal, range: nil) ?? ""
        self.generation = PokemonGenerations(rawValue: data.specie.generation) ?? .I
        self.abilities = data.abilities
        self.hatch = data.specie.hatch
        self.eggGroups = data.specie.eggGroups
        self.femaleRate = data.specie.femaleRate
    }
}
