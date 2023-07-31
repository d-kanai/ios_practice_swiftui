//
//  ios_practice_swiftuiApp.swift
//  ios_practice_swiftui
//
//  Created by daiki kanai on 2023/07/31.
//

import SwiftUI

@main
struct ios_practice_swiftuiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
