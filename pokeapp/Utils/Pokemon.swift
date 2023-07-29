//
//  Pokemon.swift
//  pokeapp
//
//  Created by Edisson Mata on 28/7/23.
//

import Foundation
import SwiftUI

class PokemonType {
    var typeName: PokemonTypeNames
    var typeImageName: String
    var typeColor: Color
    var typeColorLight: Color

    init(
        typeName: PokemonTypeNames
    ) {
        self.typeName = typeName
        self.typeImageName = "type-\(self.typeName)".lowercased()
        self.typeColor = Color("ColorType\(self.typeName)")
        self.typeColorLight = Color("ColorType\(self.typeName)Light")
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

class Pokemon {
    var name: String
    var id: String
    var imageUrl: URL
    var types: [PokemonType]
    
    init(
        name: String,
        id: String,
        imageUrl: URL,
        types: [PokemonType]
    ) {
        self.name = name
        self.id = id
        self.imageUrl = imageUrl
        self.types = types
    }
}
