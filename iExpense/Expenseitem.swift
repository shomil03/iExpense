//
//  Expenseitem.swift
//  iExpense
//
//  Created by Shomil Singh on 17/09/23.
//

import Foundation
import SwiftData
//
//struct ExpenseItem:Identifiable , Codable{
//    var id = UUID()
//    let name : String
//    let type : String
//    let amount : Double
//}
@Model
class Expenseitem{
    var id = UUID()
    var name : String
    var type : String
    var amount : Double
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
    

    
}


