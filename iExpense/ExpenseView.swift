//
//  ExpenseView.swift
//  iExpense
//
//  Created by Shomil Singh on 25/03/24.
//

import SwiftUI
import SwiftData

struct ExpenseView: View {
    @Query var expenses : [Expenseitem]
    @Environment(\.modelContext) var modelContext
    @State private var showingsheet = false
    var body: some View {
        List{
            ForEach(expenses){expense in
                NavigationLink{
                    AddExpense(expense: expense)
                }
                    label: {
                        HStack{
                            Text(expense.name)
                                .font(.title3)
                            Spacer()
                            VStack{
                                
                                Text(String(format: "%.2f", expense.amount))
                                    .font(.callout)
                                    .fontWeight(.semibold)
                            }
                        }
                        .foregroundStyle(style(amount: expense.amount))
                        
                    }
                    

                
            }
            .onDelete(perform: removeExpense)
                    }
    }
    init(type : [String] ,
         sortOrder : [SortDescriptor<Expenseitem>]){
        _expenses = Query(filter: #Predicate<Expenseitem>{expense in
            return type.contains(expense.type)
        } , sort: sortOrder)
    }
    func style(amount : Double)->Color{
        if(amount <= 10 )
        {
            return Color.green
        }
        else if(amount > 10 && amount < 100)
        {
            return Color.orange
        }
        return Color.red
        
    }
    func removeExpense(atOffSet : IndexSet){
        for offSet in atOffSet{
            let model = expenses[offSet]
            modelContext.delete(model)
        }
        
    }
}

#Preview {
    ExpenseView(type: ["Personal"], sortOrder: [SortDescriptor(\Expenseitem.name)])
}
