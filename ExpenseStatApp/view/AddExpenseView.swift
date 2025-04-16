//
//  AddExpenseView.swift
//  ExpenseStatApp
//
//  Created by Stagiaire on 16/04/2025.
//

import SwiftUI

struct AddExpenseView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var amount: String = ""
    @State private var category:ExpenseCategory = .other
    @State private var date: Date = Date()
    @State private var note: String  = ""
    
    var expenseVM: ExpenseViewModel
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Detail de la dépense")){
                    TextField("Montant (€)", text: $amount)
                        .keyboardType(.decimalPad)
                    Picker("Catégoteries", selection: $category){
                        ForEach(ExpenseCategory.allCases){ cat in
                            Text(cat.rawValue).tag(cat)
                        }
                    }
                    DatePicker("Date ", selection: $date, displayedComponents: .date)
                    TextField("Note (optionelle)", text: $note)
                }
                Button(action: addExpense){
                    Label("Ajouter dépense", systemImage: "checkmark.circle.fill")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .navigationTitle("Ajouter une dépense")
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button("Annuler"){
                        dismiss()
                    }
                }
            }
        }
    }
    func addExpense(){
        guard let amountDouble = Double(amount), amountDouble > 0 else { return }
        
        expenseVM.addExpense(amount: amountDouble, category: category, date: date, note: note.isEmpty ? nil : note)
        dismiss()
    }
}
