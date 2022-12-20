//
//  AddView.swift
//  iExpense
//
//  Created by Orlando Moraes Martins on 20/12/22.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses : Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var currencySel = "USD"
    let currencyCodes = ["USD", "BRL", "EUR", "GBP"]
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                
                Picker("Currency code", selection: $currencySel){
                    ForEach(currencyCodes, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                TextField("Amount", value: $amount, format: .currency(code: currencySel))
                    .keyboardType(.decimalPad)
                    .id(currencySel)
                
                
            }
            .navigationTitle("Add new expense")
            .toolbar(content: {
                Button("Save"){
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            })
        }
    }
}


