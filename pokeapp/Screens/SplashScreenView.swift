//
//  SplashScreenView.swift
//  pokeapp
//
//  Created by Edisson Mata on 28/7/23.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            CustomBackgroundView()
            Image("pokeball")
                .resizable()
                .frame(width: 105, height: 105)
                .foregroundColor(.customSnow.opacity(0.8))
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
