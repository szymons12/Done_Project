//
//  SecCircle.swift
//  Done
//
//  Created by Szymon on 14/10/2025.
//

import SwiftUI

struct SecCircle: View {
    @State private var showBack = true
    var body: some View {
        ZStack{
            Circle()
                .stroke(.black, lineWidth: 1)
                .frame(width: 250, height: 250)
                .overlay(
                    Text("2")
                        .font(.custom("InterVariable-Regular", size: 64))
                        .foregroundColor(.black)
                ) .opacity(showBack ? 1 : 0)
            
            Circle()
                .stroke(.black, lineWidth: 1)
                .frame(width: 250, height: 250)
                .overlay(
                    Text("noga")
                        .font(.custom("InterVariable-Regular", size: 64))
                        .foregroundColor(.black)
                ) .opacity(showBack ? 0 : 1)
            
        } // ZStack
        .animation(.easeInOut(duration: 0.4), value: showBack)
        .onTapGesture {
            showBack.toggle()}
    }
}

#Preview {
    SecCircle()
}
