//
//  ContentView.swift
//  iExpense
//
//  Created by Orlando Moraes Martins on 20/12/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    enum Status {
        case cheap(color: Color = .green)
        case acceptable(color: Color = .blue)
        case expensive(color: Color = .red)
        
        var color: Color{
            switch self {
            case .cheap(let color):
                return color
                
            case .acceptable(let color):
                return color
                
            case.expensive(let color):
                return color
            }
        }
    }
    
    var body: some View {
        NavigationView{
            List {
                ForEach(expenses.items, id: \.id){ item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                         Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                            .foregroundColor( item.amount > 100 ? Color.yellow : Color.white)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button{
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
