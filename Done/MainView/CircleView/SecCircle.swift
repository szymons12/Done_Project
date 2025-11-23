//
//  SecCircle.swift
//  Done
//
//  Created by Szymon on 14/10/2025.
//

import SwiftUI
import SwiftData

struct SecCircle: View {
    @Query private var danetask: [Task]
    @Environment(\.modelContext) private var context
    @State var wpiszDane = ""
    @State private var showBack = true
    @State private var wyswietlenie = true
    @State private var schowajPrzy = false
    @State private var alert = false
    @State private var aktualneZadanie : Task?
    @FocusState private var ukryjKlaw: Bool
    var body: some View {
        ZStack{
            Circle()
                .stroke(.black, lineWidth: 1)
                .frame(width: 250, height: 250)
                .overlay(
                    Text("2")
                        .font(.custom("InterVariable-Regular", size: 64))
                        .foregroundColor(.black)
                ) .opacity(showBack ? 1 : 0)
            
            Circle()
                .stroke(.black, lineWidth: 1)
                .frame(width: 250, height: 250)
                .overlay(
                    VStack{
                        ZStack{
                            TextField("type smth...", text: $wpiszDane,axis: .vertical)
                                .opacity(wyswietlenie ? 1:0)
                                .focused($ukryjKlaw)
                                .alert("Błąd", isPresented: $alert){
                                    Button("OK"){}
                                } message: {
                                    Text("Pole nie może być puste")
                                }
                            
                            Text("\(wpiszDane)")
                                .opacity(wyswietlenie ? 0:1)
                        } //ZStack
                        .frame(width: 150, height: 150, alignment: .center)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .font(.custom("InterVariable-Regular", size: 20))
                        
                            Button{
                                Zapisywanie()
                                ukryjKlaw = false 
                            } label: {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 70, height: 30)
                                    .overlay(Text("save")
                                        .font(.custom("InterVariable-ExtraLight", size: 20))
                                        .foregroundColor(.white))
                                    .foregroundColor(.black)
                            
                            }.opacity(schowajPrzy ? 0:1)
                    
                    }//VStack
                    
                    
                ) .opacity(showBack ? 0 : 1)
            
        } // ZStack
        
        .contentShape(Circle())
        .contextMenu {
            Button("Edit", action: { edytowanie() })
            Button("Usuń", role: .destructive, action: { usuwanie() })
        }
        .animation(.easeInOut(duration: 0.4), value: showBack)
        .onTapGesture {
            showBack.toggle()}
        .onAppear{
            ladowanie()
        }
    }// View
    
//------------------------------------ Funkcje 
    private func Zapisywanie(){
        guard !wpiszDane.trimmingCharacters(in: .whitespaces).isEmpty else {
            alert = true
            return }
        
        if let obiektKlasy = aktualneZadanie {
            obiektKlasy.content = wpiszDane
        } else{
            
            let obiektKlasy = Task(content: wpiszDane, tasknum: .task2)
            context.insert(obiektKlasy)
            aktualneZadanie = obiektKlasy
        }
        schowajPrzy = true
        wyswietlenie = false
       
     }
    private func edytowanie(){
        
        schowajPrzy = false
        wyswietlenie = true
    }
    
    private func usuwanie(){
       if let obiektKlasy = aktualneZadanie {
            context.delete(obiektKlasy)
           aktualneZadanie = nil
        }
        schowajPrzy = false
        wyswietlenie = true
        wpiszDane = ""
    }
    private func ladowanie() {
        if let obiektKlasy = danetask.first(where: {$0.tasknum == .task2}){
            aktualneZadanie = obiektKlasy
            wpiszDane = obiektKlasy.content
            wyswietlenie = false
            schowajPrzy = true
        }
    }
}


#Preview {
    SecCircle()
        .modelContainer(for: Task.self, inMemory: true)
}
