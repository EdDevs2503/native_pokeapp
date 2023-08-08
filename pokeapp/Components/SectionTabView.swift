//
//  SectionTabView.swift
//  pokeapp
//
//  Created by Edisson Mata on 6/8/23.
//

import SwiftUI

struct SectionTabView: View {
    @Binding var currentIndex: Int
    @State var tabs: [String]
    @State var color: Color
    
    var body: some View {
        HStack {
            ForEach(tabs.indices, id: \.self) { index in
                let isSelected: Bool = index == currentIndex
                Button {
                    currentIndex = index
                } label: {
                    ZStack {
                        if (isSelected) {
                            RoundedRectangle(cornerRadius: 19.31)
                                .foregroundColor(color)
                                .shadow(
                                    color: color,
                                    radius: 2
                                )
                        }
                        Text(tabs[index])
                            .foregroundColor(isSelected ? .customSnow : color)
                            .fontWeight(.medium)
                            .font(.custom("Avenir", size: 13))
                    }
                    .frame(width: 110, height: 32.5)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct SectionTabView_Previews: PreviewProvider {
    static var previews: some View {
        @State var index: Int = 0
        SectionTabView(currentIndex: $index, tabs: ["STATS", "EVOLUTIONS", "MOVES"], color: .customTypeIce)
    }
}
