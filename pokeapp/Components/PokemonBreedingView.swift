//
//  PokemonBreedingView.swift
//  pokeapp
//
//  Created by Edisson Mata on 1/9/23.
//

import SwiftUI

struct PokemonBreedingView: View {
    @State var titleColor: Color
    @State var eggGroups: [String]
    @State var hatchTime: Int
    @State var femaleRate: Int
    @State var steps: Float
    @State var progressValue: Float = 0.0


    var body: some View {
        VStack(spacing: 0) {
            Text("Breeding")
                .font(.custom("Avenir", size: 20))
                .fontWeight(.medium)
                .foregroundColor(titleColor)
                .padding(.vertical, 10)
            HStack(spacing: 0) {
                HStack {
                    VStack {
                        Text("Egg Group")
                            .font(.custom("Avenir", size: 15))
                            .fontWeight(.medium)
                            .foregroundColor(titleColor)
                            .padding(.bottom, 1)
                        ForEach(eggGroups, id: \.self) { eggGroup in
                            Text(eggGroup.capitalizedSentence)
                                .font(.custom("Avenir", size: 15))
                        }
                    }
                    .frame(maxWidth: .infinity)
                    Rectangle()
                        .frame(width: 1)
                        .foregroundColor(.customLight)
                }
                HStack {
                    VStack {
                        Text("Hatch Time")
                            .font(.custom("Avenir", size: 15))
                            .fontWeight(.medium)
                            .foregroundColor(titleColor)
                            .padding(.bottom, 1)
                        Text("\(hatchTime) Cycles")
                            .font(.custom("Avenir", size: 15))
                        Text("\(Int(steps)) Steps")
                            .font(.custom("Avenir", size: 15))
                    }
                    .frame(maxWidth: .infinity)
                    Rectangle()
                        .frame(width: 1)
                        .foregroundColor(.customLight)
                }
                VStack {
                    Text("Gender")
                        .font(.custom("Avenir", size: 15))
                        .fontWeight(.medium)
                        .foregroundColor(titleColor)
                        .padding(.bottom, 1)
                    PokemonGenderView(femaleRatio: Float(femaleRate))

                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct PokemonBreedingView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonBreedingView(
            titleColor: .customTypeWater,
            eggGroups: ["Monster", "Water I"],
            hatchTime: 20,
            femaleRate: 1,
            steps: 5
        )
    }
}
