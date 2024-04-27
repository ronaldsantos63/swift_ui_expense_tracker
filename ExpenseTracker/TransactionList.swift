//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Ronald Santos on 27/04/24.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionVM: TransactionListViewModel
    var body: some View {
        VStack {
            // MARK: Transaction Group
            List {
                ForEach(Array(transactionVM.groupTransactionsByMonth()), id: \.key) {month, transactions in
                    Section {
                        // MARK: Transaction List
                        ForEach(transactions) { transaction in
                            TransactionRow(transactionModel: transaction)
                        }
                    } header: {
                        // MARK: Transaction Month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        Group {
            NavigationView {
                TransactionList()
            }
            NavigationView {
                TransactionList()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}
