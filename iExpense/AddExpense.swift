//
//  AddExpense.swift
//  iExpense
//
//  Created by Shomil Singh on 18/09/23.
//

import SwiftUI
import SwiftData

struct AddExpense: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var type = "Personal"
    var types = ["Business","Personal"]
    let locale = Locale.current.currencySymbol
    @State private var showingalert = false
    @Bindable var expense : Expenseitem
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Name",text: $expense.name)
                Picker("Type", selection: $expense.type){
                    ForEach(types,id: \.self){
                        Text($0)
                    }
                    
                }
                TextField("\(Locale.current.currency?.identifier ?? "USD")", text: Binding<String>(
                    get:{
                        (expense.amount) == 0 ? "" : String(expense.amount)
                    },
                    set: {newValue in
                    if let value = Double(newValue){
                        expense.amount = value
                    }
                }))
                    .keyboardType(.decimalPad)
                    .onTapGesture {
                        
                    }
            }
            
            .navigationTitle("AddExpense")
            .toolbar {
                Button("Save"){
                    if(!valid()){
                        showingalert.toggle()
                    }
                    else{
                       
                        modelContext.insert(expense)
                        dismiss()
                    }
                }
            }
            .alert("Error", isPresented: $showingalert, actions: {}, message: {
                Text("fill all inputs correctly")
            })
        }
    }
    func valid()->Bool{
        if(expense.name.isEmpty || expense.amount == 0){
            return false
        }
        return true
    }
}

struct AddExpense_Previews: PreviewProvider {
    static var previews: some View {
        AddExpense( expense: Expenseitem(name: "Test", type: "Personal", amount: 2))
    }
}
