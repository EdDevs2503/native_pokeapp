//
//  PokemonStatsView.swift
//  pokeapp
//
//  Created by Edisson Mata on 7/8/23.
//

import SwiftUI


struct PokemonStatsView: View {
    @State var stats: PokemonsStats
    @State var colors: [Color]
    
    var body: some View {
        VStack(spacing: 4) {
            PokemonStatView(colors: colors, name: "HP", value: stats.HP)
            PokemonStatView(colors: colors, name: "ATK", value: stats.ATK)
            PokemonStatView(colors: colors, name: "DEF", value: stats.DEF)
            PokemonStatView(colors: colors, name: "SATK", value: stats.SATK)
            PokemonStatView(colors: colors, name: "SDEF", value: stats.SDEF)
            PokemonStatView(colors: colors, name: "SPD", value: stats.SPD)
        }
    }
}

struct PokemonStatsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonStatsView(
            stats: PokemonsStats(HP: 45, ATK: 49, DEF: 49, SATK: 65, SDEF: 65, SPD: 45),
            colors: [.customTypeGrassLight, .customTypeGrass]
        )
        .padding(.horizontal, 10)
    }
}
