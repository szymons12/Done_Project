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
    
        
        @State private var inputContent: String = "" // wprowadzenie wartości Task
        @State private var displayedContent: String = "" // wyświetlana wartość Task
        @State private var showBack = false // Odsłona drugiej części koła
        @State private var showTask = false // Chowanie zapisanej wartości
        @State private var hideSaveBtn = true // Chowanie przycisku save
        @State private var currentTask: Task? = nil //
        @State private var alert = false
        @FocusState private var hideKeyboard: Bool
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
                                    .font(.custom("InterVariable", size: 20))
                            }
                            else {
                                ZStack(alignment: .center) {
                                    if inputContent.isEmpty {
                                        Text("type smth...")
                                            .foregroundColor(.gray)
                                            .multilineTextAlignment(.center)
                                            .frame(width: 150, height: 50)
                                    }
                                    
                                    TextField("", text: $inputContent, axis: .vertical)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .textInputAutocapitalization(.never)
                                        .focused($hideKeyboard)
                                        .alert("Błąd", isPresented: $alert){
                                            Button("OK"){}
                                        } message: {
                                            Text("Pole nie może być puste")
                                        }
                                    
                                }.font(.custom("InterVariable", size: 20))
                                .frame(width: 150, height: 150, alignment: .center)
                            }
                            
                            Button {
                                saveTask()
                                hideKeyboard = false
                            } label: {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 70, height: 30)
                                    .overlay(Text("save")
                                        .font(.custom("InterVariable-ExtraLight", size: 20))
                                        .foregroundColor(.black))
                                    .foregroundColor(.white)
                            }.opacity(hideSaveBtn ? 1 : 0)
                        }// VStack
                         
                    )
                    .opacity(showBack ? 1 : 0)
            }//ZStack
            .contextMenu {
                Button("Edit", action: { editTask() })
                Button("Usuń", role: .destructive, action: { deleteTask() })
            }
            .animation(.easeInOut(duration: 0.4), value: showBack)
            .onTapGesture {
                showBack.toggle()
            }
            .onAppear {
                loadTask()
            }
        }//View
        
        // FUNKCJA ZAPISYWANIA
        private func saveTask() {
            guard !inputContent.trimmingCharacters(in: .whitespaces).isEmpty else {
                alert = true
                return }
                    
            
            if let task = currentTask {
                // Edycja istniejącego zadania
                task.content = inputContent
            } else {
                // Tworzenie nowego zadania
                let newTask = Task(content: inputContent, tasknum: .task1)
                context.insert(newTask)
                currentTask = newTask
            }
            
            displayedContent = inputContent
            showTask = true
            hideSaveBtn = false
            
        }
        
        
        private func editTask() {
            inputContent = displayedContent
            showTask = false
            hideSaveBtn = true
        }
        
      
        private func deleteTask() {
            if let task = currentTask {
                context.delete(task)
                currentTask = nil
            }
            
            inputContent = ""
            displayedContent = ""
            showTask = false
            hideSaveBtn = true
        }
        

        private func loadTask() {
            if let task = DisplayContent.first {
                currentTask = task
                displayedContent = task.content
                inputContent = task.content
                showTask = true
                hideSaveBtn = false
            }
        }
    
       
    }

    #Preview {
        OneCircle()
            .modelContainer(for: Task.self, inMemory: true)
    }
