//
//  PokemonType.swift
//  pokeapp
//
//  Created by Edisson Mata on 28/7/23.
//

import SwiftUI

struct PokemonTypeView: View {
    
    @State var pokemonType: PokemonType
    @State var displayName: Bool
    
    var body: some View {
        HStack {
            Image(pokemonType.typeImageName)
                .padding(.leading, displayName ? 14 : 0)
            if (displayName) {
                Spacer()
                Text(pokemonType.typeName.rawValue.uppercased())
                    .font(.custom("Avenir", size: 12))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Spacer()
            }
        }
//        .padding(.horizontal, 14)
        .frame(maxWidth: displayName ? 104 : 30)
        .frame(height: 30)
        .background(
            RoundedRectangle(cornerRadius: 104)
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            pokemonType.typeColor,
                            pokemonType.typeColorLight
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .shadow(
                    color: pokemonType.typeColorLight,
                    radius: 3.5
                )
        )
    }
}

struct PokemonTypeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ForEach(PokemonTypeNames.allCases, id: \.rawValue) { item in
                HStack {
                    PokemonTypeView(
                        pokemonType: PokemonType(typeName: item),
                        displayName: false
                    )
                    PokemonTypeView(
                        pokemonType: PokemonType(typeName: item),
                        displayName: true
                    )
                }
            }
        }
    }
}
