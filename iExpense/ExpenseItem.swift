//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Alex Bonder on 7/25/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
