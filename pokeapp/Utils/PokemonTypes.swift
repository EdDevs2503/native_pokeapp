//
//  PokemonTypes.swift
//  pokeapp
//
//  Created by Edisson Mata on 9/8/23.
//

import Foundation
import SwiftUI

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
enum PokemonWeaknessValues: Double {
    case Weak = 2
    case Moderate = 1
    case Strong = 0.5
    case NoEffect = 0
}
struct PokemonTypeWeakness {
    var Fire: PokemonWeaknessValues = .Moderate
    var Water: PokemonWeaknessValues = .Moderate
    var Bug: PokemonWeaknessValues = .Moderate
    var Dark: PokemonWeaknessValues = .Moderate
    var Dragon: PokemonWeaknessValues = .Moderate
    var Electric: PokemonWeaknessValues = .Moderate
    var Fairy: PokemonWeaknessValues = .Moderate
    var Fight: PokemonWeaknessValues = .Moderate
    var Flying: PokemonWeaknessValues = .Moderate
    var Ghost: PokemonWeaknessValues = .Moderate
    var Grass: PokemonWeaknessValues = .Moderate
    var Ground: PokemonWeaknessValues = .Moderate
    var Ice: PokemonWeaknessValues = .Moderate
    var Normal: PokemonWeaknessValues = .Moderate
    var Psychic: PokemonWeaknessValues = .Moderate
    var Rock: PokemonWeaknessValues = .Moderate
    var Steel: PokemonWeaknessValues = .Moderate
    var Poison: PokemonWeaknessValues = .Moderate
    
    private func _compareAllWeaknesses(_ comparator: (PokemonWeaknessValues) -> Bool) -> [PokemonTypeNames: Bool] {
        return [
            .Fire: comparator(Fire),
            .Water: comparator(Water),
            .Bug: comparator(Bug),
            .Dark: comparator(Dark),
            .Dragon: comparator(Dragon),
            .Electric: comparator(Electric),
            .Fairy: comparator(Fairy),
            .Fight: comparator(Fight),
            .Flying: comparator(Flying),
            .Ghost: comparator(Ghost),
            .Grass: comparator(Grass),
            .Ground: comparator(Ground),
            .Ice: comparator(Ice),
            .Normal: comparator(Normal),
            .Psychic: comparator(Psychic),
            .Rock: comparator(Rock),
            .Steel: comparator(Steel),
            .Poison: comparator(Poison),
        ]
    }
    
    var allWeakness: Set<PokemonTypeNames> {
        get {
            return Set(_compareAllWeaknesses({ $0 == .Weak }).filter({ $0.value == true }).keys)
        }
    }
    
    var allStrenghts: Set<PokemonTypeNames> {
        get {
            return Set(_compareAllWeaknesses({ $0 == .Strong || $0 == .NoEffect }).filter({ $0.value == true }).keys)
        }
    }
    
    func compare (_ toCompare: PokemonTypeWeakness) -> PokemonTypeWeakness {
        let s1 = allWeakness.subtracting(toCompare.allStrenghts)
        let s2 = toCompare.allWeakness.subtracting(allStrenghts)

        var toReturn = PokemonTypeWeakness()
        
        toReturn.setWeaknessAndStrenght(s1.union(s2), allStrenghts.union(toCompare.allStrenghts))
        
        return toReturn
    }
    
    mutating func setWeaknessAndStrenght (_ totalWeakness: Set<PokemonTypeNames>, _ totalStrenghts: Set<PokemonTypeNames>) -> Void {
        func dynamicMutation(_ setAsWeakness: Bool, _ value: PokemonTypeNames) -> Void {
            switch value {
            case .Fire:
                self.Fire = setAsWeakness ? .Weak : .Strong
                return;
            case .Water:
                self.Water = setAsWeakness ? .Weak : .Strong
            case .Bug:
                self.Bug = setAsWeakness ? .Weak : .Strong
            case .Dark:
                self.Dark = setAsWeakness ? .Weak : .Strong
            case .Dragon:
                self.Dragon = setAsWeakness ? .Weak : .Strong
            case .Electric:
                self.Electric = setAsWeakness ? .Weak : .Strong
            case .Fairy:
                self.Fairy = setAsWeakness ? .Weak : .Strong
            case .Fight:
                self.Fight = setAsWeakness ? .Weak : .Strong
            case .Flying:
                self.Flying = setAsWeakness ? .Weak : .Strong
            case .Ghost:
                self.Ghost = setAsWeakness ? .Weak : .Strong
            case .Grass:
                self.Grass = setAsWeakness ? .Weak : .Strong
            case .Ground:
                self.Ground = setAsWeakness ? .Weak : .Strong
            case .Ice:
                self.Ice = setAsWeakness ? .Weak : .Strong
            case .Normal:
                self.Normal = setAsWeakness ? .Weak : .Strong
            case .Poison:
                self.Poison = setAsWeakness ? .Weak : .Strong
            case .Psychic:
                self.Psychic = setAsWeakness ? .Weak : .Strong
            case .Rock:
                self.Rock = setAsWeakness ? .Weak : .Strong
            case .Steel:
                self.Steel = setAsWeakness ? .Weak : .Strong
            }
        }
        
        totalWeakness.forEach { value in dynamicMutation(true, value) }
        totalStrenghts.forEach { value in dynamicMutation(false, value) }

    }
}

func getTypeWeaknesses(_ typeToCompare: PokemonTypeNames) -> PokemonTypeWeakness {
    switch typeToCompare {
    case .Fire:
        return PokemonTypeWeakness(Fire: .Strong, Water: .Weak, Bug: .Strong, Fairy: .Strong, Grass: .Strong, Ground: .Weak, Ice: .Strong, Rock: .Weak, Steel: .Strong)
    case .Water:
        return PokemonTypeWeakness(Fire: .Strong, Water: .Strong, Electric: .Weak, Grass: .Weak, Ice: .Strong, Steel: .Strong)
    case .Bug:
        return PokemonTypeWeakness(Fire: .Weak, Fight: .Strong, Flying: .Weak, Grass: .Strong, Ground: .Strong, Rock: .Weak)
    case .Dark:
        return PokemonTypeWeakness(Bug: .Weak, Dark: .Strong, Fairy: .Weak, Fight: .Weak, Ghost: .Strong, Psychic: .NoEffect)
    case .Dragon:
        return PokemonTypeWeakness(Fire: .Strong, Water: .Strong, Dragon: .Weak, Electric: .Strong, Fairy: .Weak, Grass: .Strong, Ice: .Weak)
    case .Electric:
        return PokemonTypeWeakness(Electric: .Strong, Flying: .Strong, Ground: .Weak, Steel: .Strong)
    case .Fairy:
        return PokemonTypeWeakness(Bug: .Strong, Dark: .Strong, Dragon: .NoEffect, Fight: .Strong, Steel: .Weak, Poison: .Weak)
    case .Fight:
        return PokemonTypeWeakness(Bug: .Strong, Dark: .Strong, Fairy: .Weak, Flying: .Weak, Psychic: .Weak, Rock: .Strong)
    case .Flying:
        return PokemonTypeWeakness(Bug: .Strong, Electric: .Weak, Fight: .Strong, Grass: .Strong, Ground: .NoEffect, Ice: .Weak, Rock: .Weak)
    case .Ghost:
        return PokemonTypeWeakness(Bug: .Strong, Dark: .Weak, Fight: .NoEffect, Ghost: .Weak, Normal: .NoEffect, Poison: .Strong)
    case .Grass:
        return PokemonTypeWeakness(Fire: .Weak, Water: .Strong, Bug: .Weak, Electric: .Strong, Flying: .Weak, Grass: .Strong, Ground: .Strong, Ice: .Weak, Poison: .Weak)
    case .Ground:
        return PokemonTypeWeakness(Water: .Weak, Electric: .NoEffect, Grass: .Weak, Ice: .Weak, Rock: .Strong, Poison: .Strong)
    case .Ice:
        return PokemonTypeWeakness(Fire: .Weak, Fight: .Weak, Ice: .Strong, Rock: .Weak, Steel: .Weak)
    case .Normal:
        return PokemonTypeWeakness(Fight: .Weak, Ghost: .Strong)
    case .Poison:
        return PokemonTypeWeakness(Bug: .Strong, Fairy: .Strong, Fight: .Strong, Grass: .Strong, Ground: .Weak, Psychic: .Weak, Poison: .Strong)
    case .Psychic:
        return PokemonTypeWeakness(Bug: .Weak, Dark: .Weak, Fight: .Strong, Ghost: .Weak, Psychic: .Strong)
    case .Rock:
        return PokemonTypeWeakness(Fire: .Strong, Water: .Weak, Fight: .Weak, Flying: .Strong, Grass: .Weak, Ground: .Weak, Normal: .Strong, Steel: .Weak, Poison: .Weak)
    case .Steel:
        return PokemonTypeWeakness(Fire: .Weak, Bug: .Strong, Dragon: .Strong, Fairy: .Strong, Fight: .Weak, Flying: .Strong, Grass: .Strong, Ground: .Strong, Ice: .Strong, Normal: .Strong, Psychic: .Strong, Rock: .Strong, Steel: .Strong, Poison: .NoEffect)
    }
}


