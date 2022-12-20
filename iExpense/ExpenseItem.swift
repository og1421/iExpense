//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Orlando Moraes Martins on 20/12/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
