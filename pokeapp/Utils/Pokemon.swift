//
//  Pokemon.swift
//  pokeapp
//
//  Created by Edisson Mata on 28/7/23.
//

import Foundation
import SwiftUI

let maxBaseStat: Double = 225.0
let minBaseStat: Double = 1.0
struct PokemonType: Hashable {
    var typeName: PokemonTypeNames
    var typeImageName: String {
        get {
            return "type-\(self.typeName)".lowercased()
        }
    }
    var typeColor: Color {
        get {
            return Color("ColorType\(self.typeName)")
        }
    }
    var typeColorLight: Color {
        return Color("ColorType\(self.typeName)Light")
    }
}

enum PokemonTypeNames: String, CaseIterable {
    case Fire = "Fire"
    case Water = "Water"
    case Bug = "Bug"
    case Dark = "Dark"
    case Dragon = "Dragon"
    case Electric = "Electric"
    case Fairy = "Fairy"
    case Fight = "Fight"
    case Flying = "Flying"
    case Ghost = "Ghost"
    case Grass = "Grass"
    case Ground = "Ground"
    case Ice = "Ice"
    case Normal = "Normal"
    case Poison = "Poison"
    case Psychic = "Psychic"
    case Rock = "Rock"
    case Steel = "Steel"
}

@propertyWrapper
struct Stat {
    private let getSecureStatVal = { $0 > maxBaseStat ? maxBaseStat : $0 < minBaseStat ? minBaseStat : $0}
    private var value: Double = 1
    var wrappedValue: Double {
        get {
            return value
        }
        set {
            value = getSecureStatVal(newValue)
        }
    }
}
struct PokemonsStats {
    @Stat var HP: Double
    @Stat var ATK: Double
    @Stat var DEF: Double
    @Stat var SATK: Double
    @Stat var SDEF: Double
    @Stat var SPD: Double

    var TOTAL: Double {
        get {
            return HP + ATK + DEF + SATK + SDEF + SPD
        }
    }
    
    init(HP: Double, ATK: Double, DEF: Double, SATK: Double, SDEF: Double, SPD: Double) {
        self.HP = HP
        self.ATK = ATK
        self.DEF = DEF
        self.SATK = SATK
        self.SDEF = SDEF
        self.SPD = SPD
    }
}
struct Pokemon: Hashable {
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    var name: String
    var id: String
    var imageUrl: URL
    var types: [PokemonType]
    var stats: PokemonsStats?
    var description: String?
}
