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
    @State private var showBack = true
    @State private var showTask = false
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
                        }
                        else
                        {
                            TextField("Type sth...", text: $inputContent, axis: .vertical)
                                .frame(width: 150, height: 150, alignment: .center)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                        Button {
                            let newTask = Task(content: inputContent, tasknum: .task1)
                            context.insert(newTask)
                            displayedContent = inputContent
                            showTask = true
                        } label: {
                            Text("save")
                            
                        }
                       
                    }
                )
                .opacity(showBack ? 1 : 0)
        } // ZStack
        .animation(.easeInOut(duration: 0.4), value: showBack)
        .onTapGesture {
            showBack.toggle()}
    }
}

#Preview {
    OneCircle()
    .modelContainer(for: Task.self, inMemory: true)
}
