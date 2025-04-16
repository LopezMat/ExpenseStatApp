//
//  ExpenseViewModel.swift
//  Expense
//
//  Created by Stagiaire on 16/04/2025.
//
 
import Foundation
import SwiftUI
 
@Observable
class ExpenseViewModel {
    var expenses: [Expense] = []
    
    func addExpense(amount: Double, category: ExpenseCategory, date: Date, note: String?){
        let expense: Expense = Expense(amount: amount, category: category, date: date, note: note)
        expenses.append(expense)
    }
    
    func removeExpense(at offsets: IndexSet){
        expenses.remove(atOffsets: offsets)
    }
    
    func expenses(byMonth month: Int, year: Int) -> [Expense]{
        expenses.filter { expense in
            let expenseMonth = Calendar.current.component(.month, from: expense.date)
            let expenseYear = Calendar.current.component(.year, from: expense.date)
            return expenseMonth == month && expenseYear == year
        }
    }
    
    func categoryTotal(forMonth month:Int, year:Int) -> [(category: ExpenseCategory, total:Double)]{
        ExpenseCategory.allCases.map{ category in
            let total = expenses(byMonth: month, year: year)
                .filter{ $0.category == category }
                .reduce(0){ $0 + $1.amount }
            return (category, total)
        }.filter { $0.total > 0 }
    }
    
    func totalExpense(forMonth month: Int, year: Int) -> Double {
        expenses(byMonth: month, year: year).reduce(0){$0 + $1.amount}
    }
}
