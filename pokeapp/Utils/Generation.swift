//
//  Generation.swift
//  pokeapp
//
//  Created by Edisson Mata on 26/8/23.
//

import Foundation

struct Generation: Hashable {
    let name: String
    let order: Int
    let pokemons: [Pokemon]
}
