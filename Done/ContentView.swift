//
//  ContentView.swift
//  Done
//
//  Created by Szymon on 14/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            AllCircleView().frame(width: 500,height: 350)
            HStack{
                PlusRoundRecView()
                Spacer().frame(width:350)
                    
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
