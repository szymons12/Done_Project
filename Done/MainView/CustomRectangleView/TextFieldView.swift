//
//  TextFieldView.swift
//  Done
//
//  Created by Szymon on 17/10/2025.
//

import SwiftUI

struct TextFieldView: View {
    @State private var noteArray: [Notebook] = [Notebook(note: "")]

    
    func saveNotes(){
        if let encoded = try? JSONEncoder().encode(noteArray) {
            UserDefaults.standard.set(encoded, forKey: "savedNotes")
        }
    }
    
    func loadNotes(){
        if let savedData = UserDefaults.standard.data(forKey: "savedNotes"),
           let decoded = try? JSONDecoder().decode([Notebook].self, from: savedData) {
            noteArray = decoded
        } else {
            noteArray = [Notebook(note: "")]
        }
    }
    
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
                ScrollView{
                    VStack{
                        ForEach(noteArray.indices, id: \.self) { index in
                            HStack(){
                                Image(systemName: "circle")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.gray)
                                TextField("Type...", text: $noteArray[index].note, axis: .vertical)
                                    .font(.custom("InterVariable-Thin", size: 20))
                                    .onChange(of: noteArray[index].note) {oldValue, newValue in
                                        if index == noteArray.count - 1 && !newValue.isEmpty{
                                            noteArray.append(Notebook(note: ""))
                                        }
                                        if newValue.isEmpty && index != noteArray.count - 1 && noteArray.count > 1{
                                            noteArray.remove(at:index)
                                        }
                                        saveNotes()
                                    }
                            }.frame(width: 240,height: 50)
                            
                            
                        }// Foreach
                        Spacer().frame( height: 180)
                    }// VStack
                }//ScrollView
            )//Overlay
            .onAppear{
                loadNotes()
            }
//            .contentShape(UnevenRoundedRectangle())
            .onTapGesture {
                hideKeyboard()
            }
        }
    }


#Preview {
    TextFieldView()
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
