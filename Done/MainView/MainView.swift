//
//  MainView.swift
//  Done
//
//  Created by Szymon on 19/11/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        ZStack {
            VStack{
                SecCircle().frame(width: 300,height: 300)
                HStack{
                    Spacer(minLength: 0)
                    IdeasView()
                }
                    HStack{
                        PlusRoundRecView()
                        Spacer(minLength: 0)
                        TextFieldView()
                    }
            }
        }
    }
}

#Preview {
    MainView()
}
