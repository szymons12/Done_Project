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
//        HStack(spacing:-10){
//            WypukloscZKola()
//                .frame(width: 80, height: 150)
//                .overlay(Text("+")
//                    .foregroundColor(.white))
//                
//            OneCircle()
//            
//            WypukloscZKola()
//                .frame(width: 80, height: 150)
//                .overlay(Text("+")
//                    .foregroundColor(.white))
//                .rotationEffect(.degrees(180))
//        }
        Button{
            print("sus")
        }label: {
            OneCircle()
                .foregroundColor(.black)
            
        }
        .contextMenu {
            Button("Opcja 1", action: { print("Wybrano 1") })
            Button("Opcja 2", action: { print("Wybrano 2") })
            Button("Usuń", role: .destructive, action: { print("Usuń") })
        }
        
                            
    }
}
        
        
#Preview{
        TestView()
        }
    
