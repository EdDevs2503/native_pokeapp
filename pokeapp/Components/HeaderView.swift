//
//  SearchBarView.swift
//  pokeapp
//
//  Created by Edisson Mata on 28/7/23.
//

import SwiftUI

struct HeaderView: View {
    @Binding var searchText: String
    @State var title: String
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                Text("\(self.title)")
                    .font(.custom("Avenir", size: 20))
                    .fontWeight(.medium)
                SearchBarView(searchText: $searchText)
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
        @State var searchText: String = ""

        VStack {
            HeaderView(searchText: $searchText, title: "Pokemon")
            Spacer()
        }

    }
}
