//
//  getPokemons.swift
//  pokeapp
//
//  Created by Edisson Mata on 26/8/23.
//

import Foundation



func getPokemons() -> [Generation] {
    
    if let path = Bundle.main.path(forResource: "pokemon-data", ofType: "json") {
        do {
            let fileUrl = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: fileUrl)
            
            let decodedData: PokemonsData = try JSONDecoder().decode(PokemonsData.self, from: data)
            let pokemonList: [Pokemon] = decodedData.pokemons.map { Pokemon(data: $0) }
            
            var pokemonsByGen: [String: [Pokemon]] = [:]
            
            pokemonList.forEach { pokemon in
                if (pokemonsByGen[pokemon.generation?.rawValue ?? ""] != nil) {
                    pokemonsByGen[pokemon.generation?.rawValue ?? ""]?.append(pokemon)
                } else {
                    pokemonsByGen[pokemon.generation?.rawValue ?? ""] = [pokemon]
                }
            }
            var counter = 0
            
            return pokemonsByGen.values.map { pokemonListByGen in
                counter += 1
                let name = pokemonListByGen[0].generation!
                do {
                    let order = try RomanNumeralFor(String(name.rawValue.split(separator: "-")[1]).uppercased())
                    return Generation(name: name.rawValue, order: order, pokemons: pokemonListByGen)
                } catch {
                    return Generation(name: name.rawValue, order: -1, pokemons: pokemonListByGen)
                }
                
            }
            
        } catch let error {
            print(error)
        }
    }
    return []
}
