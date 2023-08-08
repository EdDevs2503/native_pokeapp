//
//  ContentView.swift
//  pokeapp
//
//  Created by Edisson Mata on 28/7/23.
//

import SwiftUI

struct TabViewItems {
    var pokemon: CustomTabItem = CustomTabItem(rawImage: "pokemon", name: "Pokemon", tab: .Pokemon)
    var moves: CustomTabItem = CustomTabItem(rawImage: "moves", name: "Moves", tab: .Moves)
    var items: CustomTabItem = CustomTabItem(rawImage: "items", name: "Items", tab: .Items)
}

struct ContentView: View {
    @State var selectTabIndex: TabViewIndex = .Pokemon
    @State var searchText: String = ""

    var body: some View {
        VStack(spacing: 0) {
            switch selectTabIndex {
            case .Pokemon:
                PokemonScreenView()
            default:
                Spacer()
            }
            CustomTabView(
                items: [
                    CustomTabItem(rawImage: "pokemon", name: "Pokemon", tab: TabViewIndex.Pokemon),
                    CustomTabItem(rawImage: "moves", name: "Moves", tab: TabViewIndex.Moves),
                    CustomTabItem(rawImage: "items", name: "Items", tab: TabViewIndex.Items),

                ],
                selectedIndex: $selectTabIndex
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
