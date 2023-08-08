//
//  CustomTabItemView.swift
//  pokeapp
//
//  Created by Edisson Mata on 2/8/23.
//

import SwiftUI

struct CustomTabItemView: View {
    @State var item: CustomTabItem
    
    var body: some View {
        VStack(spacing: 0) {
            Image(item.rawImage)
                .resizable()
                .scaledToFit()
                .frame(width: 28)
                .foregroundStyle(
                    Color.black.opacity(1)
                )
            Text(item.name)
                .font(.custom("SF Pro Text", size: 10))
                .foregroundColor(.black.opacity(1))
        }    }
}

struct CustomTabItemView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabItemView(item: CustomTabItem(rawImage: "pokemon", name: "Pokemon", tab: .Pokemon))
    }
}
