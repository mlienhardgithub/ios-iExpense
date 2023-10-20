//
//  Expenses.swift
//  iExpense
//
//  Created by Martin Lienhard on 1/27/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] = [ExpenseItem]() {
        didSet {
            let encoder: JSONEncoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            let decoder: JSONDecoder = JSONDecoder()
            
            if let decodedItems = try? decoder.decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
