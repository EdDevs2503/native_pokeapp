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
    @State var generations: [Generation] = []
    

    @State private var scrollID: Int?
    
    var body: some View {
            VStack(spacing: 0) {
                HeaderView(
                    searchText: $searchText,
                    title: "Pokemon"
                )
                ScrollView(showsIndicators: false) {
                    ForEach(generations.sorted { $0.order < $1.order } , id: \.self) { generation in
                        PokemonGenerationView(generation: generation)
                    }
                }
            }
            .onAppear {
                self.generations = getPokemons()
            }
            .sheet(isPresented: $isSheetOpen) {
                PokemonDetailsScreenView(pokemon: $pokemonForSheet)
                    .presentationDetents([.fraction(0.8)])
                    .presentationDragIndicator(.visible)
            }
    }
    
}



struct PokemonScreenView_Previews: PreviewProvider {
    static var previews: some View {
        @State var searchText: String = "test"

        PokemonScreenView()
    }
}
