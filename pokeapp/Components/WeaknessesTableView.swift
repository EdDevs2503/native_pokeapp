//
//  WeaknessesTableView.swift
//  pokeapp
//
//  Created by Edisson Mata on 9/8/23.
//

import SwiftUI

struct WeaknessesTableView: View {
    @State var typesToCompare: [PokemonType]
    
    var body: some View {        
        let weakness: PokemonTypeWeakness = typesToCompare.reduce(PokemonTypeWeakness()) { reduced, toCompare in
            let weakness = getTypeWeaknesses(toCompare.typeName)
            return reduced.compare(weakness)
        }
        
        VStack(spacing: 25) {
            Text("Weaknesses")
                .font(.custom("Avenir", size: 20))
                .fontWeight(.medium)
                .foregroundColor(typesToCompare[0].typeColor)
            HStack(spacing: 25) {
                VStack(alignment: .leading) {
                    PokemonWeaknessView(type: .Bug, weakness: weakness.Bug)
                    PokemonWeaknessView(type: .Electric, weakness: weakness.Electric)
                    PokemonWeaknessView(type: .Fire, weakness: weakness.Fire)
                    PokemonWeaknessView(type: .Grass, weakness: weakness.Grass)
                    PokemonWeaknessView(type: .Normal, weakness: weakness.Normal)
                    PokemonWeaknessView(type: .Rock, weakness: weakness.Rock)
                }
                VStack(alignment: .leading) {
                    PokemonWeaknessView(type: .Dark, weakness: weakness.Dark)
                    PokemonWeaknessView(type: .Fairy, weakness: weakness.Fairy)
                    PokemonWeaknessView(type: .Flying, weakness: weakness.Flying)
                    PokemonWeaknessView(type: .Ground, weakness: weakness.Ground)
                    PokemonWeaknessView(type: .Poison, weakness: weakness.Poison)
                    PokemonWeaknessView(type: .Steel, weakness: weakness.Steel)
                }
                VStack(alignment: .leading) {
                    PokemonWeaknessView(type: .Dragon, weakness: weakness.Dragon)
                    PokemonWeaknessView(type: .Fight, weakness: weakness.Fight)
                    PokemonWeaknessView(type: .Ghost, weakness: weakness.Ghost)
                    PokemonWeaknessView(type: .Ice, weakness: weakness.Ice)
                    PokemonWeaknessView(type: .Psychic, weakness: weakness.Psychic)
                    PokemonWeaknessView(type: .Water, weakness: weakness.Water)
                }
            }
        }
    }
}

struct WeaknessesTableView_Previews: PreviewProvider {
    static var previews: some View {
        WeaknessesTableView(typesToCompare: [PokemonType(typeName: .Flying), PokemonType(typeName: .Steel)])
    }
}
