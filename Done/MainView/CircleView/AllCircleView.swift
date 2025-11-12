//
//  AllCircleView.swift
//  Done
//
//  Created by Szymon on 14/10/2025.
//

import SwiftUI

struct AllCircleView: View {
    var body: some View {
        ZStack{
            
                OneCircle()
            VStack{
                Spacer().frame(height: 100)
                HStack{
                    SecCircle()
                    Spacer().frame(width: 100)
                    ThirdCircle()
                }//HStack
            }
        } // ZStack
    }
}

#Preview {
    AllCircleView()
}
