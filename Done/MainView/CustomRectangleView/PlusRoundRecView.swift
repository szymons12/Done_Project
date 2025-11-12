//
//  PlusRoundRecView.swift
//  Done
//
//  Created by Szymon on 17/10/2025.
//

import SwiftUI

struct PlusRoundRecView: View {
    var body: some View {
        UnevenRoundedRectangle(
            topLeadingRadius: 0,
            bottomLeadingRadius: 0,
            bottomTrailingRadius: 20, topTrailingRadius: 20
        )
        .frame(width: 70, height: 60)
        .overlay(
            Image(systemName: "plus")
                .foregroundColor(.white)
                .font(.custom("InterVariable-Thin", size: 64))
        )
        
        
            
    }
}

#Preview {
    PlusRoundRecView()
}
