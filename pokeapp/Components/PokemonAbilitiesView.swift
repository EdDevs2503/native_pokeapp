//
//  PokemonAbilitiesView.swift
//  pokeapp
//
//  Created by Edisson Mata on 30/8/23.
//

import SwiftUI

struct PokemonAbilitiesView: View {
    @State var titleColor: Color
    @State var abilities: [AbilityData]
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Abilities")
                .font(.custom("Avenir", size: 20))
                .fontWeight(.medium)
                .foregroundColor(titleColor)
                .padding(.vertical, 10)
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0..<abilities.count, id: \.self) { index in
                        let ability = abilities[index]
                        VStack(alignment: .leading, spacing: 0) {
                            Text(ability.name)
                                .font(.custom("Avenir", size: 15))
                                .fontWeight(.medium)
                                .foregroundColor(titleColor)
                                .padding(.bottom, 1)
                            Text(ability.effect?.replacingOccurrences(of: "\n", with: "") ?? "")
                                .font(.custom("Avenir", size: 15))
                                .fontWeight(.light)
                            if (index != abilities.count - 1) {
                                Rectangle()
                                    .frame(height: 1)
                                    .padding(.top, 7)
                                .foregroundColor(.customLight)
                            }
                            
                        }
                        .padding(.vertical, 5)
                }
            }
                
            
//            .padding(.vertical, 5)
        }
    }
}

struct PokemonAbilitiesView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonAbilitiesView(titleColor: .customTypeWater, abilities: [AbilityData(id: 1, name: "Overgrow", effect: "When this Pokémon has 1/3 or less of its HP remaining, its grass-type moves inflict 1.5× as much regular damage."), AbilityData(id: 2, name: "Overgrow", effect: "When this Pokémon has 1/3 or less of its HP remaining, its grass-type moves inflict 1.5× as much regular damage.")])
    }
}
