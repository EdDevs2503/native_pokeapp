//
//  PokemonGenderView.swift
//  pokeapp
//
//  Created by Edisson Mata on 7/9/23.
//

import SwiftUI

struct PokemonGenderView: View {
    @State var femaleRatio: Float
    
    var body: some View {
        let maleRatioCalculated = (100 / 8) * (8 - femaleRatio)
        let femaleRatioCalculated = (100 / 8) * femaleRatio
        HStack(spacing: 11) {
            VStack {
                Text(String(format: "%.1f", femaleRatioCalculated))
                    .font(.custom("Avenir", size: 15))
                    .foregroundColor(Color.customFemale)
                Text(String(format: "%.1f", maleRatioCalculated))
                    .font(.custom("Avenir", size: 15))
                    .foregroundColor(Color.customTypeWater)
            }
            ZStack {
                Circle()
                    .stroke(lineWidth: 3.87)
                    .foregroundColor(Color.customMale)
                    .frame(width: 40, height: 40)
                Circle()
                    .trim(from: 0.0, to: CGFloat(femaleRatioCalculated / 100))
                    .stroke(lineWidth: 3.87)
                    .foregroundColor(Color.customFemale)
                    .frame(width: 40, height: 40)
                    .rotationEffect(Angle(degrees: 270.0))
                Image("genders-icon")
            }
        }
    }
}

struct PokemonGenderView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonGenderView(femaleRatio: 1)
    }
}
