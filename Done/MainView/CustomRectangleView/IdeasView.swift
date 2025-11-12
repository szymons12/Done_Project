//
//  IdeasView.swift
//  Done
//
//  Created by Szymon on 17/10/2025.
//

import SwiftUI

struct IdeasView: View {
    var body: some View {
        UnevenRoundedRectangle(
            topLeadingRadius: 20,
            bottomLeadingRadius: 20,
            bottomTrailingRadius: 0,
            topTrailingRadius: 0
        )
        .frame(width: 140, height: 60)
        .overlay(
            Text("Ideas")
                .foregroundColor(.white)
                .font(.custom("InterVariable-Thin", size: 45))
        )
    }
}

#Preview {
    IdeasView()
}
