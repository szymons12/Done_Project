//
//  TextFieldView.swift
//  Done
//
//  Created by Szymon on 17/10/2025.
//

import SwiftUI

struct TextFieldView: View {
    @State private var username: String = ""
    var body: some View {
            UnevenRoundedRectangle(
                topLeadingRadius: 20,
                bottomLeadingRadius: 20,
                bottomTrailingRadius: 0,
                topTrailingRadius: 0
            )
            .stroke(.black, style: StrokeStyle(
                dash: [10, 10]
            ))
            . frame(width: 270,height: 270)
            .overlay(
                List{
                    Text("cos")
                }
                )
             //Overlay
        
    }
}

#Preview {
    TextFieldView()
}
