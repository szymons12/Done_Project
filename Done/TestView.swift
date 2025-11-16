//
//  TestView.swift
//  Done
//
//  Created by Szymon on 17/10/2025.
//

import SwiftUI
import SwiftData

struct TestView: View {
    var body: some View {
//
//        Button{
//            print("sus")
//        }label: {
//            OneCircle()
//                .foregroundColor(.black)
//            
//        }
//        .contextMenu {
//            Button("Edit", action: { print("Wybrano 1") })
//            Button("Usuń", role: .destructive, action: { print("Usuń") })
//        }
        ForEach(0..<4) { index in
            HStack{
                Image(systemName: "dot.fill")
                    .background(Color.black)
            }}
                            
    }
}
        
        
#Preview{
        TestView()
        }
    
