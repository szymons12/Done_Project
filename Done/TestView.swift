//
//  TestView.swift
//  Done
//
//  Created by Szymon on 1a7/10/2025.
//

import SwiftUI
import SwiftData

struct TestView: View {
    @State private var wpiszDane: String = ""
    var body: some View {
       
        VStack {
            // TextField poza kołem - na dole
            TextEditor(text: $wpiszDane)
                .frame(height: 100)
                .padding()
                .background(Color.gray.opacity(0.2))
        }
            
    }
        
}

        
        
#Preview{
        TestView()
        }
    
