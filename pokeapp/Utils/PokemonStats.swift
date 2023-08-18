//
//  PokemonStats.swift
//  pokeapp
//
//  Created by Edisson Mata on 9/8/23.
//

import Foundation
import PokemonAPI

let maxBaseStat: Double = 225.0
let minBaseStat: Double = 1.0


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
    init(_ stats: [PKMPokemonStat]) {
        for stat in stats {
            switch(stat.stat?.name) {
            case "hp":
                self.HP = Double(stat.baseStat ?? 0)
            case "attack":
                self.ATK = Double(stat.baseStat ?? 0)
            case "defense":
                self.DEF = Double(stat.baseStat ?? 0)
            case "special-attack":
                self.SATK = Double(stat.baseStat ?? 0)
            case "special-defense":
                self.SDEF = Double(stat.baseStat ?? 0)
            case "speed":
                self.SPD = Double(stat.baseStat ?? 0)
            default:
                print("No valid type")
            }
        }
    }
}
