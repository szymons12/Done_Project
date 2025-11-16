//
//  OneCircle.swift
//  Done
//
//  Created by Szymon on 14/10/2025.
//

import SwiftUI
import SwiftData

struct OneCircle: View {
    @Query private var DisplayContent: [Task]
    @Environment(\.modelContext) private var context
    
    @State private var inputContent: String = ""
    @State private var displayedContent: String = ""
    @State private var showBack = true  // odslona drugiej czesci kola
    @State private var showTask = false // chowanie zapisanej wartosci
    @State private var hideSaveBtn = true // chowanie przycisku save
  
    
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 250, height: 250)
                .overlay(
                    Text("1")
                        .font(.custom("InterVariable-Black", size: 64))
                        .foregroundColor(.white)
                )
                .opacity(showBack ? 0 : 1)
            
            Circle()
                .frame(width: 250, height: 250)
                .overlay(
                    VStack{
                        if(showTask == true){
                            Text("\(displayedContent)")
                                .foregroundColor(.white)
                                .frame(width: 150, height: 150, alignment: .center)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        } //IF
                            else {
                                ZStack(alignment: .center) {
                                    if inputContent.isEmpty {
                                        Text("type smth...")
                                            .foregroundColor(.gray)
                                            .multilineTextAlignment(.center)
                                    }
                                    
                                    
                                    TextField("", text: $inputContent, axis: .vertical)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                }
                                .frame(width: 150, height: 150, alignment: .center)
                                
                            } // Else
                            
                            Button {
                                let newTask = Task(content: inputContent, tasknum: .task1)
                                context.insert(newTask)
                                displayedContent = inputContent
                                showTask = true
                                hideSaveBtn = false
                            } label: {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 70, height: 30)
                                    .overlay(Text("save")
                                        .foregroundColor(.black))
                                    .foregroundColor(.white)
                                
                            }.opacity(hideSaveBtn ? 1 : 0)
                        }
                        

                       
                    
                ) //Overlay
                .opacity(showBack ? 1 : 0)
        } // ZStack
        .contextMenu {
                       Button("Edit", action: { print("Wybrano 1") })
                       Button("Usuń", role: .destructive, action: { print("Usuń") })}
        .animation(.easeInOut(duration: 0.4), value: showBack)
        .onTapGesture {
            showBack.toggle()}
    }
}

#Preview {
    OneCircle()
    .modelContainer(for: Task.self, inMemory: true)
}
