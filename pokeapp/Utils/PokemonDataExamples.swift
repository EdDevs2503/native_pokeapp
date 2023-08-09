//
//  PokemonDataExamples.swift
//  pokeapp
//
//  Created by Edisson Mata on 8/8/23.
//

import Foundation

let firstPokemonGroup: [Pokemon] = [
    Pokemon(
        name: "Bulbasour",
        id: "#001",
        imageUrl: URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png")!,
        types: [PokemonType(typeName: .Grass), PokemonType(typeName: .Poison)],
        stats: PokemonsStats(HP: 45, ATK: 49, DEF: 49, SATK: 65, SDEF: 65, SPD: 45),
        description: "Bulbasaur es un Pokémon cuadrúpedo de color verde y manchas más oscuras de formas geométricas. Su cabeza representa cerca de un tercio de su cuerpo."
    ),
    Pokemon(
        name: "Charmander",
        id: "#004",
        imageUrl: URL(string: "https://archives.bulbagarden.net/media/upload/2/27/0004Charmander.png")!,
        types: [
            PokemonType(typeName: .Fire)
        ],
        stats: PokemonsStats(HP: 39, ATK: 52, DEF: 43, SATK: 60, SDEF: 50, SPD: 65),
        description: "La llama que tiene en la punta de la cola arde según sus sentimientos. Llamea levemente cuando está alegre y arde vigorosamente cuando está enfadado."
    ),
    Pokemon(
        name: "Squirtle",
        id: "#007",
        imageUrl: URL(string: "https://images.wikidexcdn.net/mwuploads/wikidex/thumb/e/e3/latest/20160309230820/Squirtle.png/520px-Squirtle.png")!,
        types: [
            PokemonType(typeName: .Water)
        ],
        stats: PokemonsStats(HP: 45, ATK: 49, DEF: 49, SATK: 65, SDEF: 65, SPD: 45),
        description: "El caparazón de Squirtle no le sirve de protección únicamente. Su forma redondeada y las hendiduras que tiene le ayudan a reducir su resistencia al agua y le permiten nadar a gran velocidad."
    )
]
