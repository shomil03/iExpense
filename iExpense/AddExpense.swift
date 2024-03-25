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
    @State private var name = ""
    @State private var type = "Personal"
    var types = ["Business","Personal"]
    let locale = Locale.current.currencySymbol
    @State private var amount : String = ""
    @State private var showingalert = false
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name",text: $name)
                Picker("Type", selection: $type){
                    ForEach(types,id: \.self){
                        Text($0)
                    }
                    
                }
                TextField("\(Locale.current.currency?.identifier ?? "USD")", text:$amount)
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
                        let newExpense = Expenseitem(name: name, type: type, amount: Double(amount) ?? 0)
                        modelContext.insert(newExpense)
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
        if(name.isEmpty || amount.isEmpty || !amount.contains(["1","2","3","4","5","6","7","8","9","0"])){
            return false
        }
        return true
    }
}

struct AddExpense_Previews: PreviewProvider {
    static var previews: some View {
        AddExpense()
    }
}
