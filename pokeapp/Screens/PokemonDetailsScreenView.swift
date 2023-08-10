//
//  PokemonDetailsScreenView.swift
//  pokeapp
//
//  Created by Edisson Mata on 1/8/23.
//

import SwiftUI
import Transmission

enum SectionTabItems: Int {
    case Stats = 0
    case Evolutions = 1
    case Moves = 2
}


struct PokemonDetailsScreenView: View {
    @Binding var pokemon: Pokemon
    @State var sectionIndex: Int = 0
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                CustomImageView(url: pokemon.imageUrl, color: pokemon.types[0].typeColor, sizes: (170, 170))
                Text(pokemon.name)
                    .font(.custom("Avenir", size: 40))
                    .foregroundColor(.customDark)
                
                HStack {
                    ForEach(pokemon.types, id: \.self) { type in
                        PokemonTypeView(pokemonType: type, displayName: true)
                    }
                }
                .padding(.top, 10)
                Text(pokemon.description ?? "Description is not available now.")
                    .padding(.top, 15)
                    .font(.custom("Avenir", size: 15))
                    .foregroundColor(.customDark)
                    .padding(.bottom, 15)
                SectionTabView(currentIndex: $sectionIndex, tabs: ["STATS", "EVOLUTIONS", "MOVES"], color: pokemon.types[0].typeColor
                )
                .padding(.top, 10)
                
                switch sectionIndex {
                case 0:
                    VStack(spacing: 30) {
                        PokemonStatsView(
                            stats: pokemon.stats!,
                            colors: [pokemon.types[0].typeColorLight, pokemon.types[0].typeColor]
                        )
                        WeaknessesTableView(typesToCompare: pokemon.types)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 9)
                default:
                    Spacer()
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
        }
        .scrollBounceBehavior(.basedOnSize)
        .padding(.top, 10)
    }
}

struct SomeRandomView: View {
    @State var open: Bool = false
    @State var pokemon: Pokemon = Pokemon(
        name: "Squirtle",
        id: "#002",
        imageUrl: URL(string: "https://images.wikidexcdn.net/mwuploads/wikidex/thumb/e/e3/latest/20160309230820/Squirtle.png/520px-Squirtle.png")!,
        types: [
            PokemonType(typeName: .Water)
        ],
        stats: PokemonsStats(HP: 45, ATK: 49, DEF: 49, SATK: 65, SDEF: 65, SPD: 45)
    )
    
    var body: some View {
        Button("Press here broda") {
            open.toggle()
        }.sheet(isPresented: $open) {
            PokemonDetailsScreenView(pokemon: $pokemon)
            .presentationDetents([.fraction(0.7766)])
            .presentationDragIndicator(.visible)
        }
    }
}

struct PokemonDetailsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SomeRandomView()
    }
}
