
//  StatsView.swift
//  Expense
//
//  Created by Stagiaire on 16/04/2025.
//
 
import SwiftUI
import Charts
 
struct StatsView: View {
    
    @State private var selectDate: Date = Date()
    
    var expenseVM: ExpenseViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                DatePicker("Sekectionner une date", selection: $selectDate, displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .padding()
                List{
                    Section(header: Text("total par categorie")){
                        ForEach(expenseVM.categoryTotal(forMonth: month, year: year), id: \.category){ item in
                            HStack{
                                Text(item.category.rawValue)
                                Spacer()
                                Text("\(item.total, specifier: "%.2f") €")
                            }
                        }
                    }
                }
                
                Chart(expenseVM.categoryTotal(forMonth: month, year: year), id: \.category) { item in
                    SectorMark(angle: .value("Montant", item.total), innerRadius: .ratio(0.5), angularInset: 5)
                        .foregroundStyle(by: .value("Catégorie", item.category.rawValue))
                        .cornerRadius(5)
                        .annotation(position: .overlay){
                            Text("\(item.total, specifier: "ù.2f") €")
                                .font(.caption)
                                .foregroundStyle(.white)
                                .bold()
                        }
                }
                
                .chartLegend(position: .bottom, spacing: 15)
                .chartBackground{ proxy in
                    GeometryReader{ geometry in
                        Text("Total :  \(expenseVM.totalExpense(forMonth: month, year: year), specifier: "%.2f") €")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.secondary)
                            .position(x: geometry.size.width / 2, y:geometry.size.height / 2 )
                    }
                }
                .frame(height: 250)
                .padding(5)
            }
        }
        .navigationTitle("Statistiques")
    }
    
    var month:Int {
        Calendar.current.component(.month, from: selectDate)
    }
    var year:Int {
        Calendar.current.component(.year, from: selectDate)
    }
}
