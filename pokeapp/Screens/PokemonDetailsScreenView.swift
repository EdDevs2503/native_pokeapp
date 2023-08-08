//
//  PokemonDetailsScreenView.swift
//  pokeapp
//
//  Created by Edisson Mata on 1/8/23.
//

import SwiftUI
import Transmission

struct PokemonDetailsScreenView: View {
    @State var pokemon: Pokemon
    @State var sectionIndex: Int = 0
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                AsyncImage(url: pokemon.imageUrl) { Image in
                    Image
                        .resizable()
                        .frame(width: 170, height: 170)
                    
                } placeholder: {
                    ProgressView()
                }
                Text(pokemon.name)
                    .font(.custom("Avenir", size: 40))
                    .foregroundColor(.customDark)
                
                HStack {
                    ForEach(pokemon.types, id: \.self) { type in
                        PokemonTypeView(pokemonType: type, displayName: true)
                    }
                }
                .padding(.top, 10)
                Text("Squirtle’s shell is not merely used for protection. The shell’s rounded shape and the grooves on its surface help minimize resistance in water, enabling this pokemon to swim at high speed.")
                    .padding(.top, 15)
                    .font(.custom("Avenir", size: 15))
                    .foregroundColor(.customDark)
                    .padding(.bottom, 15)
                SectionTabView(currentIndex: $sectionIndex, tabs: ["STATS", "EVOLUTIONS", "MOVES"], color: pokemon.types[0].typeColor
                )
                .padding(.top, 10)
                PokemonStatsView(
                    stats: pokemon.stats!,
                    colors: [pokemon.types[0].typeColorLight, pokemon.types[0].typeColor]
                )
                .padding(.top, 20)

                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
        }
        .scrollBounceBehavior(.basedOnSize)
    }
}

struct SomeRandomView: View {
    @State var open: Bool = false

    var body: some View {
        Button("Press here broda") {
            open.toggle()
        }.sheet(isPresented: $open) {
            PokemonDetailsScreenView(pokemon: Pokemon(
                name: "Squirtle",
                id: "#002",
                imageUrl: URL(string: "https://images.wikidexcdn.net/mwuploads/wikidex/thumb/e/e3/latest/20160309230820/Squirtle.png/520px-Squirtle.png")!,
                types: [
                    PokemonType(typeName: .Water)
                ],
                stats: PokemonsStats(HP: 45, ATK: 49, DEF: 49, SATK: 65, SDEF: 65, SPD: 45)
            ))
            .presentationDetents([.fraction(0.7766)])
        }
    }
}

struct PokemonDetailsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SomeRandomView()
    }
}
