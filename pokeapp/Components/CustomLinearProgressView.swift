//
//  CustomLinearProgressView.swift
//  pokeapp
//
//  Created by Edisson Mata on 7/8/23.
//

import SwiftUI

struct CustomLinearProgressView: View {
    @State var colors: [Color]
    @State var value: CGFloat
    @State var modifier: Float = 0.0
    
    var body: some View {
        GeometryReader { G in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(.customDarkSnow)
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: (G.size.width * value) * CGFloat(modifier))
                    .foregroundStyle(
                        LinearGradient(
                            colors: colors,
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .onAppear {
                        withAnimation(
                            Animation.easeInOut(duration: 0.5)
                                .delay(0.35)
                        ) {
                            modifier = 1.0
                        }
                    }
            }
        }
        .frame(height: 6.5)
    }
}

struct CustomLinearProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CustomLinearProgressView(colors: [.customTypeWaterLight, .customTypeWater], value: 0.3)
    }
}
