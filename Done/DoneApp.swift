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
            TestView()
                .modelContainer(for:Task.self)
        }
    }
}
