//
//  CustomSheetView.swift
//  pokeapp
//
//  Created by Edisson Mata on 1/8/23.
//

import SwiftUI

struct CustomSheetView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isShowing = false
                        }
                    }
                
                VStack {
                    
                    Text("Hello sheet!")
                    
                }
                .frame(maxWidth: .infinity)
                .frame(maxHeight: 250)
                .background(.white)
                .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
        
    }
}



struct CustomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        @State var isShowing: Bool = false
        CustomSheetView(isShowing: $isShowing)
    }
}
