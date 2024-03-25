//
//  ContentView.swift
//  iExpense
//
//  Created by Shomil Singh on 13/09/23.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @Query var expenses : [Expenseitem]
    @Environment(\.modelContext) var modelContext
    @State private var showing_AddExpense = false
    @State private var showingPersonal = ["Personal"]
    @State private var sortBy = [SortDescriptor(\Expenseitem.name)]
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Spacer()
                    Menu("Filter" , systemImage:"arrow.up.arrow.down"){
                        Picker("Personal" , selection: $showingPersonal){
                            Text("Personal record")
                                .tag(["Personal"])
                            Text("Business record")
                                .tag(["Business"])
                            Text("All")
                                .tag(["Business" , "Personal"])
                        }
                    }
                    .buttonStyle(BorderedProminentButtonStyle())
                        Menu("Sort" , systemImage: "arrow.up.arrow.down"){
                            Picker("Name"  , selection: $sortBy ){
                                Label("Name", systemImage: "arrowshape.up.fill")
                                    .tag([SortDescriptor(\Expenseitem.name , order: .reverse) ])
                                Label("Name", systemImage: "arrowshape.down.fill")
                                    .tag([SortDescriptor(\Expenseitem.name)])
                                Label("Amount", systemImage: "arrowshape.up.fill")
                                    .tag([SortDescriptor(\Expenseitem.amount , order: .reverse)])
                                Label("Amount", systemImage: "arrowshape.down.fill")
                                    .tag([SortDescriptor(\Expenseitem.amount)])
                            
                        }
                        
                    }
                        .buttonStyle(BorderedProminentButtonStyle())
                        .padding(.horizontal)
                }
                ExpenseView(type: showingPersonal, sortOrder: sortBy)
                    
                    
                
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
                let newExpense = Expenseitem(name: "", type: "Personal", amount: 0)
                AddExpense(expense: newExpense)
            }
            .scrollBounceBehavior(.basedOnSize)
        }
    }
   
    func removeItems(atoffset : IndexSet){
        //        expenses.items.remove(atOffsets: atoffset)
        
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
////    @Published is used to publish announcement when ever its value is changed
//    @Published var first = "Shomil"
//    @Published var last = "Singh"
//}
// when you want to encode and decode instances of a custom struct or class to and from external representations like JSON or property lists, you need to specify that your type conforms to the Codable protocol. The Codable protocol is a typealias that combines two other protocols: Encodable and Decodable
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
