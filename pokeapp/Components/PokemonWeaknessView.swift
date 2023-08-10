//
//  PokemonWeaknessView.swift
//  pokeapp
//
//  Created by Edisson Mata on 9/8/23.
//

import SwiftUI



struct PokemonWeaknessView: View {
    @State var type: PokemonTypeNames
    @State var weakness: PokemonWeaknessValues
    
    var body: some View {
        HStack(spacing: 20) {
            PokemonTypeView(pokemonType: PokemonType(typeName: type), displayName: false)
            Text("x\(weakness == .Strong ? "1/2" : String(weakness.rawValue))")
                .font(.custom("Avenir", size: 18))
                .foregroundColor(.customDark)
        }
        .frame(maxWidth: .infinity)
    }
}

struct PokemonWeaknessView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonWeaknessView(type: .Electric, weakness: .Strong)
    }
}
