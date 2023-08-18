//
//  PokemonScreenView.swift
//  pokeapp
//
//  Created by Edisson Mata on 29/7/23.
//

import SwiftUI
import PokemonAPI

let api = PokemonAPI()

struct PokemonScreenView: View {
    @State var searchText: String = ""
    @State var isSheetOpen: Bool = false
    @State var pokemonForSheet: Pokemon = firstPokemonGroup[0]
    @State var pokemons: [Pokemon] = []
    @State var page: Int = 1
    
    var body: some View {
            VStack(spacing: 0) {
                HeaderView(
                    searchText: $searchText,
                    title: "Pokemon"
                )
                ScrollView(showsIndicators: false) {
                    ForEach(pokemons.sorted { Int($0.id)! < Int($1.id)! } , id: \.self) { pokemon in
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
            .onAppear {
                Task.init {
                    let pagedPokemons = try await api.pokemonService.fetchPokemonList(paginationState: .initial(pageLimit: 100))
                    if (pagedPokemons.results?.isEmpty ?? true != true) {
                        for pokemonId in 1...(pagedPokemons.results?.count ?? 1) {
                            Task {
                                let pokemonData = try await api.pokemonService.fetchPokemon(pokemonId)
                                var pokemonTypes: [PokemonType] = []
                                pokemonData.types?.forEach({ rawDataType in
                                    let typeName = rawDataType.type?.name ?? "normal"
                                    pokemonTypes.append(PokemonType(typeName: PokemonTypeNames(rawValue: typeName) ?? PokemonTypeNames.Normal))
                                })
                                let newPokemon = Pokemon(
                                    name: pokemonData.name ?? "Default",
                                    id: pokemonData.id != nil ? String(pokemonData.id!) : "",
                                    imageUrl: URL(string: pokemonData.sprites?.frontDefault ?? "")!,
                                    types: pokemonTypes,
                                    stats: PokemonsStats(pokemonData.stats ?? [])
                                )
                                pokemons.append(newPokemon)
                            }
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
