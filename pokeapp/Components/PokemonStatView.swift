//
//  PokemonStatView.swift
//  pokeapp
//
//  Created by Edisson Mata on 7/8/23.
//

import SwiftUI

let getStatPercentage = { CGFloat($0 / maxBaseStat) }

struct PokemonStatView: View {
    @State var colors: [Color]
    @State var name: String
    @State var value: Double


    var body: some View {
        HStack(spacing: 8) {
            Text(name)
                .font(.custom("Avenir", size: 12))
                .fontWeight(.heavy)
                .frame(width: 35, alignment: .leading)
            
            Text(String(Int(value)))
                .font(.custom("Avenir", size: 14))
                .fontWeight(.light)
                .frame(width: 30, alignment: .leading)
            CustomLinearProgressView(colors: colors, value: getStatPercentage(value))
        }
    }
}

struct PokemonStatView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonStatView(colors: [.customTypeGrassLight, .customTypeGrass], name: "HP", value: 45)
    }
}
