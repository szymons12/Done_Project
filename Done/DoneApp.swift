//
//  DoneApp.swift
//  Done
//
//  Created by Szymon on 14/10/2025.
//

import SwiftUI
import SwiftData

@main
struct DoneApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for:Task.self)
                .preferredColorScheme(.light)
        }
    }
}
