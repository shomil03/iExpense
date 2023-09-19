//
//  AddExpense.swift
//  iExpense
//
//  Created by Shomil Singh on 18/09/23.
//

import SwiftUI

struct AddExpense: View {
    @ObservedObject var expense : Expenses
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    var types = ["Business","Personal"]
    @State private var amount = 0.0
    var body: some View {
        NavigationView{
            Form{
                TextField("Name",text: $name)
                Picker("Type", selection: $type){
                    ForEach(types,id: \.self){
                        Text($0)
                    }
                    
                }
                TextField("Amount", value:$amount,format:.currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("AddExpense")
            .toolbar {
                Button("Save"){
                    if name == ""{
                        name = " "
                    }
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expense.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddExpense_Previews: PreviewProvider {
    static var previews: some View {
        AddExpense(expense: Expenses())
    }
}
