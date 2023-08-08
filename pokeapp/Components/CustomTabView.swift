//
//  CustomTabView.swift
//  pokeapp
//
//  Created by Edisson Mata on 30/7/23.
//

import SwiftUI

struct CustomTabView: View {
    @State var items: [CustomTabItem]
    @Binding var selectedIndex: TabViewIndex
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                LinearGradient(
                    colors: [
                        .customBlue,
                        .customLightBlue,
                        .customLightGreen,
                        .customGreen
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .frame(height: 4)
                HStack {
                    ForEach(items, id: \.self) { item in
                        Button {
                            selectedIndex = item.tab
                        } label: {
                            VStack(spacing: 0) {
                                Image(item.rawImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 28)
                                    .foregroundStyle(
                                        Color.black.opacity(selectedIndex == item.tab ? 1 : 0.3)
                                    )
                                Text(item.name)
                                    .font(.custom("SF Pro Text", size: 10))
                                    .foregroundColor(.black.opacity(selectedIndex == item.tab ? 1 : 0.3))
                            }
                            .frame(maxWidth: .infinity)
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 20)
            }
            .background(
                CustomBackgroundView()
            )
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        @State var selectedIndex: TabViewIndex = .Pokemon
        VStack {
            Spacer()
            CustomTabView(
                items: [
                    CustomTabItem(rawImage: "pokemon", name: "Pokemon", tab: .Pokemon),
                    CustomTabItem(rawImage: "moves", name: "Moves", tab: .Moves),
                    CustomTabItem(rawImage: "items", name: "Items", tab: .Items)
                ],
                selectedIndex: $selectedIndex
            )
        }
    }
}
