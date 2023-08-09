//
//  PokemonScreenView.swift
//  pokeapp
//
//  Created by Edisson Mata on 29/7/23.
//

import SwiftUI
import Transmission

var pokemons: [Pokemon] = Array(repeating: Pokemon(
    name: "Bulbasour",
    id: "#001",
    imageUrl: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")!,
    types: [
        PokemonType(typeName: .Grass),
    ],
    stats: PokemonsStats(HP: 45, ATK: 49, DEF: 49, SATK: 65, SDEF: 65, SPD: 45)
), count: 15)

struct PokemonScreenView: View {
    @State var searchText: String = ""
    @State var isSheetOpen: Bool = false
    @State var pokemonForSheet: Pokemon = firstPokemonGroup[0]
    
    var body: some View {
            VStack(spacing: 0) {
                HeaderView(
                    searchText: $searchText,
                    title: "Pokemon"
                )
                ScrollView(showsIndicators: false) {
                    ForEach(firstPokemonGroup, id: \.self) { pokemon in
                        Button {
                            pokemonForSheet = pokemon
                            isSheetOpen.toggle()
                        } label: {
                            PokemonRowView(
                                pokemon: pokemon
                            )
                        }
                    }
                }
            }
            .sheet(isPresented: $isSheetOpen) {
                PokemonDetailsScreenView(pokemon: $pokemonForSheet)
                    .presentationDetents([.fraction(0.8)])
                    .presentationDragIndicator(.visible
                    )
            }
    }
}



struct PokemonScreenView_Previews: PreviewProvider {
    static var previews: some View {
        @State var searchText: String = "test"

        PokemonScreenView()
    }
}
