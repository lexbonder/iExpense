//
//  ExpenseList.swift
//  iExpense
//
//  Created by Alex Bonder on 7/26/23.
//

import SwiftUI

struct ExpenseList: View {
    @ObservedObject var expenses: Expenses
    let type: String
    
    var body: some View {
        Section(type) {
            ForEach(type == "Personal" ? expenses.personalItems : expenses.businessItems) { item in
                HStack {
                    Text(item.name)
                        .font(.headline)
                    Spacer()
                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(getAmountColor(for: item.amount))
                }
            }
            .onDelete(perform: removeItems)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            if let index = expenses.items.firstIndex(where: {
                if type == "Personal" {
                    return $0.id == expenses.personalItems[offset].id
                } else {
                    return $0.id == expenses.businessItems[offset].id
                }
            }) {
                expenses.items.remove(at: index)
            }
        }
    }
    
    func getAmountColor(for amount: Double) -> Color {
        if amount <= 10 {
            return .green
        } else if amount > 100 {
            return .red
        } else {
            return .primary
        }
    }
}

struct ExpenseList_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseList(expenses: Expenses(), type: "Personal")
    }
}
