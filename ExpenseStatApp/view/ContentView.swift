//
//  ContentView.swift
//  Expense
//
//  Created by Stagiaire on 16/04/2025.
//
 
import SwiftUI
 
struct ContentView: View {
    
    @State private var expenseVM = ExpenseViewModel()
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(expenseVM.expenses){ expense in
                    VStack(alignment: .leading){
                        Text("\(expense.category.rawValue)")
                            .font(.headline)
                        Text("Montant : \(expense.amount, specifier: "%.2f") €")
                            .font(.subheadline)
                        if let note = expense.note {
                            Text("Note : \(note)")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .onDelete(perform: expenseVM.removeExpense)
            }
            .navigationTitle("💸 Mes dépenses")
            .toolbar{
                NavigationLink(destination: AddExpenseView(expenseVM: expenseVM)){
                    Image(systemName: "plus")
                }
            }
        }
    }
}
 
#Preview {
    ContentView()
}
 
