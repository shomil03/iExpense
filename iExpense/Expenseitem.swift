//
//  Expenseitem.swift
//  iExpense
//
//  Created by Shomil Singh on 17/09/23.
//

import Foundation
struct ExpenseItem:Identifiable , Codable{
    var id = UUID()
    let name : String
    let type : String
    let amount : Double
}
