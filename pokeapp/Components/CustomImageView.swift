//
//  CustomImageView.swift
//  pokeapp
//
//  Created by Edisson Mata on 8/8/23.
//

import SwiftUI

struct CustomImageView: View {
    @State var url: URL
    @State var color: Color
    @State var rotate: Double = 0
    @State var sizes: (CGFloat, CGFloat)
    var body: some View {
        AsyncImage(url: url) { Image in
            Image
                .resizable()
                .frame(width: sizes.0, height: sizes.1)
            
        } placeholder: {
            ZStack {
                Image("pokeball")
                    .resizable()
                    .frame(width: sizes.0 * 0.8, height: sizes.1 * 0.8)
                    .foregroundColor(color.opacity(0.4))
                    .rotationEffect(.degrees(rotate))
                    .onAppear {
                        withAnimation(.linear(duration: 2).repeatForever()) {
                            rotate = 360.0
                        }
                }
            }
            .frame(width: sizes.0, height: sizes.1)
        }
    }
}

struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageView(url: URL(string: "https://images.wikidexcdn.net/mwuploads/wikidex/thumb/e/e3/latest/20160309230820/Squirtle.png/520px-Squirtle.png")!, color: .customTypeWater, sizes: (170, 170))
    }
}
