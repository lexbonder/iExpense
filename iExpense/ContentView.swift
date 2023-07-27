//
//  ContentView.swift
//  iExpense
//
//  Created by Alex Bonder on 7/24/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                if expenses.personalItems.count > 0 {
                    ExpenseList(expenses: expenses, type: "Personal")
                }
                if expenses.businessItems.count > 0 {
                    ExpenseList(expenses: expenses, type: "Business")
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
