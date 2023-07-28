//
//  SearchBarView.swift
//  pokeapp
//
//  Created by Edisson Mata on 28/7/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                Text("Pokemon")
                    .font(.custom("Avenir", size: 20))
                    .fontWeight(.medium)
                SearchBarView()
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
            }
            .padding(.bottom, 15)
            .background(
                CustomBackgroundView()
            )
            
            Divider()
                .frame(height: 4)
                .background(
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
                )
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
    
        VStack {
            HeaderView()
            Spacer()
        }

    }
}
