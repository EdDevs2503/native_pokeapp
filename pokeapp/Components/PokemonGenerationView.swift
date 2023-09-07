//
//  PokemonGenerationView.swift
//  pokeapp
//
//  Created by Edisson Mata on 26/8/23.
//

import SwiftUI

struct PokemonGenerationView: View {
    @State var generation: Generation
    @State var isOpen: Bool = false
    @State var isSheetOpen: Bool = false
    @State var pokemonForSheet: Pokemon = firstPokemonGroup[0]

    var body: some View {
        VStack {
            Button {
                withAnimation {
                    isOpen.toggle()
                }
            } label: {
                VStack(spacing: 5) {
                    HStack {
                        Text(DisplayGenerationName(generation.name))
                            .foregroundColor(.customDark)
                        Spacer()
                        Image(systemName: "triangle.fill")
                            .foregroundColor(.customDark)
                            .rotationEffect(.degrees(isOpen ? 360 : 180))
                    }
                    Rectangle()
                        .frame(height: 1.5)
                        .foregroundColor(.customDarkSnow)

                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
            }
            if (isOpen) {
                ScrollView(showsIndicators: false) {
                    ForEach(generation.pokemons.sorted { Int($0.id)! < Int($1.id)! } , id: \.self) { pokemon in
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
        }
        .padding(.top, 10)
        .sheet(isPresented: $isSheetOpen) {
            PokemonDetailsScreenView(pokemon: $pokemonForSheet)
                .presentationDetents([.fraction(0.8)])
                .presentationDragIndicator(.visible)
        }
    }
}

struct PokemonGenerationView_Previews: PreviewProvider {
    static var previews: some View {
        let generations = getPokemons()

        PokemonGenerationView(
            generation: generations[0]
        )
    }
}
