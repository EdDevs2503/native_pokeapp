//
//  SearchBarView.swift
//  pokeapp
//
//  Created by Edisson Mata on 28/7/23.
//

import SwiftUI

struct SearchBarView: View {
    
    @State var searchText: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.customDark)
                .font(.system(size: 17))
            TextField("Search", text: $searchText)
            Button {
                // TODO: speech to text functionality
                print("recording")
            } label: {
                Image(systemName: "mic.fill")
                    .foregroundStyle(Color.customDark)
                    .font(.system(size: 17))
            }
        }
        .font(.custom("SF Pro Text", size: 17))
        .padding(.vertical, 7)
        .padding(.horizontal, 15)
        .background(
            RoundedRectangle(cornerRadius: 17)
                .fill(Color.black.opacity(0.12))
        )
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            CustomBackgroundView()
            SearchBarView()
        }
    }
}
