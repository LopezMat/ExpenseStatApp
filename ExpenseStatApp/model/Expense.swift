//
//  Expense.swift
//  ExpenseStatApp
//
//  Created by Stagiaire on 16/04/2025.
//

import Foundation

struct Expense: Indentifiable, Codable {
    var id: UUID = UUID()
    var amount: Double
    var category: ExpenseCategory
    var date: Date
    var note: String?
}

enum ExpenseCategory: String, CaseIterable, Codable, Identifiable {
        case food = "🍔 Alimentation"
        case transport = "🚌 Transport"
        case leisure = "🎮 Loisir"
        case bill = "💡 Factures"
        case health = "🩺 Santé"
        case other  = "📦 Autre"
    
    var id: String{self.rawValue}
    
}
