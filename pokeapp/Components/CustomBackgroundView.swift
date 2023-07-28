//
//  CustomBackgroundView.swift
//  pokeapp
//
//  Created by Edisson Mata on 28/7/23.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
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
            .ignoresSafeArea()
            Color.customSnow
                .opacity(0.8)
                .ignoresSafeArea()
        }
    }
}

struct CustomBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackgroundView()
    }
}
