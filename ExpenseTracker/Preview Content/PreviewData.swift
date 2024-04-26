//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Ronald Santos on 23/04/24.
//

import Foundation

var transactionPreviewData = TransactionModel(
    id: 1,
    date: "04/23/2024",
    institution: "Ronald",
    account: "Visa Ronald",
    merchant: "Apple",
    amount: 11.49,
    type: "debit",
    categoryId: 801,
    category: "Software",
    isPending: false,
    isTransfer: false,
    isExpense: true,
    isEdited: false
)

var transactionListPreviewData = [TransactionModel](repeating: transactionPreviewData, count: 10)
