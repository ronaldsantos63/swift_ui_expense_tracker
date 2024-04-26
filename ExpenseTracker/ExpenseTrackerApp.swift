//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Ronald Santos on 23/04/24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
