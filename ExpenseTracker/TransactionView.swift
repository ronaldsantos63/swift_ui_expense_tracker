//
//  TransactionView.swift
//  ExpenseTracker
//
//  Created by Ronald Santos on 27/04/24.
//

import SwiftUI

struct TransactionView: View {
    var transaction: TransactionModel
    
    var body: some View {
        List {
            // MARK: Hero
            VStack(spacing: 6) {
                Text(transaction.signedAmount, format: .currency(code: "BRL"))
                    .font(.largeTitle)
                    .bold()
                
                Text(transaction.merchant)
                    .lineLimit(1)
                
                Text(transaction.dateParsed, format: .dateTime.day().month(.wide).year())
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowSeparator(.hidden, edges: .top)
            .padding(.vertical, 16)
            
            // MARK: Merchant
            TransactionDetailRow(icon: .store, title: "Merchant", text: transaction.merchant)
            
            // MARK: Date
            TransactionDetailRow(icon: .calendar, title: "Date", text: transaction.dateParsed.formatted(.dateTime.day().month(.wide).year().weekday(.wide)))
            
            // MARK: Financial Institution
            TransactionDetailRow(icon: .landmark, title: "Financial Institution", text: transaction.institution)
            
            // MARK: Account
            TransactionDetailRow(icon: .credit_card, title: "Account", text: transaction.account)
            
            // MARK: Category
            NavigationLink {
                CategoriesView(transaction: transaction)
            } label: {
                TransactionDetailRow(icon: .list, title: "Category", text: transaction.categoryItem.name)
            }

        }
        .listStyle(.plain)
        .navigationTitle("Transação")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                TransactionView(transaction: transactionPreviewData)
            }
            NavigationView {
                TransactionView(transaction: transactionPreviewData)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
