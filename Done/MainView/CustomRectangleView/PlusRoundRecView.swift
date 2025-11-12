//
//  PlusRoundRecView.swift
//  Done
//
//  Created by Szymon on 17/10/2025.
//

import SwiftUI

struct PlusRoundRecView: View {
    @State private var isExpanded = false
    var body: some View {
        VStack{
            UnevenRoundedRectangle(
                topLeadingRadius: 0,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 20, topTrailingRadius: 20
            )
            .frame(width: isExpanded ? 700 : 70, height: 60)
            .overlay(
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.custom("InterVariable-Thin", size: 40))
            )
                        .animation(.easeInOut(duration: 0.3), value: isExpanded)
                        .onTapGesture {
                            isExpanded.toggle()
                        }
            
            UnevenRoundedRectangle(
                topLeadingRadius: 0,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 20, topTrailingRadius: 20
            )
            .frame(width: 70, height: 60)
            .foregroundColor(Color("SecColour33"))
            .overlay(
                    Text("4")
                    .foregroundColor(.white)
                    .font(.custom("InterVariable-Thin", size: 40))
            )
            
            UnevenRoundedRectangle(
                topLeadingRadius: 0,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 20, topTrailingRadius: 20
            )
            .frame(width: 70, height: 60)
            .foregroundColor(Color("ThirdColour33"))
            .overlay(
                    Text("5")
                    .foregroundColor(.white)
                    .font(.custom("InterVariable-Thin", size: 40))
            )
            
            
        }// VStack
    }
}

#Preview {
    PlusRoundRecView()
}
