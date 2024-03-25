//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Shomil Singh on 13/09/23.
//

import SwiftUI
import SwiftData
@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Expenseitem.self)
                
        }
    }
}
