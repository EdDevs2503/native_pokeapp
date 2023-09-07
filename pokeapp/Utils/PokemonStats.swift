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
    init(_ stat: StatsData) {
        self.HP = Double(stat.hp)
        self.ATK = Double(stat.attack)
        self.DEF = Double(stat.defense)
        self.SATK = Double(stat.special_attack)
        self.SDEF = Double(stat.special_defense)
        self.SPD = Double(stat.speed)
    }
}
