//
//  ThirdCircle.swift
//  Done
//
//  Created by Szymon on 14/10/2025.
//

import SwiftUI

struct ThirdCircle: View {
    @State private var showBack = true
    var body: some View {
        ZStack{
            Circle()
                .stroke(.black, style: StrokeStyle(
                    dash: [10, 10]
                ))
                .frame(width: 250, height: 250)
                .overlay(
                    Text("3")
                        .font(.custom("InterVariable-Thin", size: 64))
                        .foregroundColor(.black)
                )
                .opacity(showBack ? 1 : 0)
            
            Circle()
                .stroke(.black, style: StrokeStyle(
                    dash: [10, 10]
                ))
                .frame(width: 250, height: 250)
                .overlay(
                    Text("papie")
                        .font(.custom("InterVariable-Thin", size: 64))
                        .foregroundColor(.black)
                )
                .opacity(showBack ? 0 : 1)
        } // ZStack
        .animation(.easeInOut(duration: 0.4), value: showBack)
        .onTapGesture {
            showBack.toggle()}
    }
}

#Preview {
    ThirdCircle()
}
