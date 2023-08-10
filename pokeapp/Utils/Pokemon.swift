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
    
    var name: String
    var id: String
    var imageUrl: URL
    var types: [PokemonType]
    var stats: PokemonsStats?
    var description: String?
}
