//
//  Expenses.swift
//  iExpense
//
//  Created by Shomil Singh on 17/09/23.
//

import Foundation
class Expenses : ObservableObject{
    @Published var items = [ExpenseItem](){
        didSet {
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decoder = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decoder
                return
            }
                
        }
        items = []
    }
   
}

