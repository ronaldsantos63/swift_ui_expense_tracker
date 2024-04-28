//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Ronald Santos on 23/04/24.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    var transactionModel: TransactionModel
    
    var body: some View {
        HStack(spacing: 20) {
            // MARK: Transaction Category Icon
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: transactionModel.icon), fontsize: 24, color: Color.icon)
                }
            VStack(alignment: .leading, spacing: 6) {
                // MARK: Transaction Merchant
                Text(transactionModel.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // MARK: Transaction Category
                Text(transactionModel.categoryItem.name)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                // MARK: Transacion Date
                Text(transactionModel.dateParsed, format: .dateTime.day().month().year())
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
            
            // MARK: Transaction Amount
            Text(transactionModel.signedAmount, format: .currency(code: "BRL"))
                .bold()
                .foregroundColor(transactionModel.type == TransactionType.credit.rawValue ? Color.text : .primary)
        }
        .padding([.top, .bottom], 8)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionRow(transactionModel: transactionPreviewData)
            TransactionRow(transactionModel: transactionPreviewData)
                .preferredColorScheme(.dark)
        }
    }
}
