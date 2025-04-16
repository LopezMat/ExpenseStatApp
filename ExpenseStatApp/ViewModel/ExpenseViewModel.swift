//
//  ExpenseViewModel.swift
//  ExpenseStatApp
//
//  Created by Stagiaire on 16/04/2025.
//

import Foundation
import SwiftUI

@Observable
class ExpenseViewModel {
    //liste des dépense
    var expenses: [Expense] = [ ]
    
        // fonction d'ajout de dépense
        func addExpense(amount: Double, category : ExpenseCategory, date:Date, note: String?){
            let expense:Expense = Expense(amount: amount, category: category, date: date, note: note)
            expenses.append(expense)
    }
    
    func removeExpense(at offsets: IndexSet){
        expenses.remove(atOffsets: offsets)
    }
    
}
