//
//  PokemonRowView.swift
//  pokeapp
//
//  Created by Edisson Mata on 28/7/23.
//

import SwiftUI

struct PokemonRowView: View {
    
    @State var pokemon: Pokemon

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                CustomImageView(url: pokemon.imageUrl, color: pokemon.types[0].typeColor, sizes: (50, 50))
                    .padding(.trailing, 13)
                VStack(alignment: .leading) {
                    Text(pokemon.name)
                        .font(.custom("Avenir", size: 19))
                        .fontWeight(.medium)
                        .foregroundColor(.customDark)
                    Text(pokemon.id)
                        .font(.custom("Avenir", size: 15))
                        .fontWeight(.light)
                        .foregroundColor(.customGray)
                }
                Spacer()
                HStack {
                    ForEach(0..<pokemon.types.count, id: \.self) { index in
                        PokemonTypeView(pokemonType: pokemon.types[index], displayName: false)
                    }
                }
            }
                .padding(.bottom, 10)
            Divider()
                .frame(height: 1)
                .background(
                    Color.customLightGray
                )
        }
        .padding(.horizontal, 20)

    }
}

struct PokemonRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        PokemonRowView(
            pokemon: Pokemon(
                name: "Bolbasour",
                id: "#001",
                imageUrl: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")!,
                types: [
                    PokemonType(typeName: .Grass),
                    PokemonType(typeName: .Poison)
                ]
            )
        )
    }
}
