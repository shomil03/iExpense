//
//  ContentView.swift
//  iExpense
//
//  Created by Shomil Singh on 13/09/23.
//

import SwiftUI
struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showing_AddExpense = false
    
    var body: some View {
        NavigationView{
            List{
                Section("Personal"){
                    ForEach(expenses.items){item in
                        if item.type == "Personal"{
                            HStack{
                                VStack(alignment: .leading){
                                    Text(item.name)
                                        .font(.title)
                                    //                                .bold()
                                    Text(item.type)
                                        .bold()
                                }
                                Spacer()
                                
                                Text(item.amount,format: .currency(code: "USD"))
                                    .foregroundColor(style(amount: item.amount))
                                
                                
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                Section("Business"){
                    ForEach(expenses.items){item in
                        if item.type == "Business"{
                            HStack{
                                VStack(alignment: .leading){
                                    Text(item.name)
                                        .font(.title)
                                    //                                .bold()
                                    Text(item.type)
                                        .bold()
                                }
                                Spacer()
                                
                                Text(item.amount,format: .currency(code: "USD"))
                                    .foregroundColor(style(amount: item.amount))
                                
                                
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button{
                    showing_AddExpense = true
                }label: {
                    Image(systemName:"plus")
                }
            }
            .sheet(isPresented: $showing_AddExpense){
                AddExpense(expense: expenses)
            }
        }
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
    func removeItems(atoffset : IndexSet){
        expenses.items.remove(atOffsets: atoffset)
    }
}
//struct SecondView : View{
//    @Environment(\.dismiss) var dismiss
//    @State private var numbers = [Int]()
//    @State private var currNumber = 1
//    @State private var tapAmount = UserDefaults.standard.integer(forKey: "Add")
//    @AppStorage("delete") private var delete = 0
//    var name : String
//
//    var body: some View{
//
//
//            VStack{
//                List{
//                    Text("Tap amount :\(tapAmount)")
//                    Text("Deleted times : \(delete)")
//                    ForEach(numbers,id: \.self){
//                        Text("Row \($0)")
//
//                    }
//                    .onDelete(perform: remove)
//                }
//                Button("Add row"){
//                    tapAmount+=1
//                    numbers.append(currNumber)
//                    currNumber+=1
//                    UserDefaults.standard.set(tapAmount, forKey: "Add")
//                }
//                Button("Dismiss"){
//                    dismiss()
//                }
//            }
//
//
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing){
//                    EditButton()
//                }
//
//            }
//    }
//    func remove(at offsets : IndexSet){
//        delete+=1
//        numbers.remove(atOffsets: offsets)
//    }
//}
//// ObservervableObject is used to tell other views to check on it
//class Jame: ObservableObject{
////    @Published is used to publish announcemect when ever its value is changed
//    @Published var first = "Shomil"
//    @Published var last = "Singh"
//}
//struct User : Codable{
//    let firstname : String
//    let lastname : String
//}
//
//struct ContentView: View {
////    @StateObject views any change in object of a class
//    @StateObject private var user = Jame()
//    var userD = User(firstname: "shomil", lastname: "Singh")
//    @State private var showing_second = false
//    var body: some View {
//        VStack {
//            Text("your name is \(user.first) \(user.last)")
//            TextField("First name",text: $user.first)
//            TextField("last name",text: $user.last)
//            Button("Save user"){
//                let encoder = JSONEncoder()
//                if let data = try? encoder.encode(userD){
//                    UserDefaults.standard.set(data,forKey: "UserData")
//                }
//            }
//            Button("Show second sheet"){
//                showing_second = true
//            }
//        }
//        .sheet(isPresented: $showing_second){
//            NavigationView(){
//                SecondView(name: user.first)
//                    .navigationTitle("SecondView")
//            }
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
