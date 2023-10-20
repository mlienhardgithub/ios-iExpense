//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Martin Lienhard on 1/27/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id: UUID = UUID()
    let name: String
    let type: String
    let amount: Double
}
