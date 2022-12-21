//
//  SheetView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 18/7/2022.
//

import SwiftUI

struct SheetView: View {
    @State private var name = ""
    @State private var quantity = ""
    @State private var  details = ""
    let types = ["vegetable", "meat", "fruits", "bread" , "milk" ,"spices" ,"canned-food" ,"cleaning-materials"]
    @State private var type = "vegetable"
    var heightOptions = ["L","mL", "kg" ,"g"]
    @State private var heightselection = ""
    @State private var price = ""
    @State private var Currency = ""
    var CurrencySymbol = ["$","€", "£" ,"¥"]
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var prospects: Prospects
    @ObservedObject var viewModel = UploadProductViewModel()
    var body: some View {
        NavigationView{
                VStack{
                    Form{
                        Section("Types"){
                            HStack{
                                Image(type)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(12)
                                
                                Picker("", selection: $type) {
                                    ForEach(types, id: \.self) { typ in
                                        HStack( spacing: 10){
                                            Text(typ)
                                            
                                        }
                                    }
                                }
                                
                            }
                            
                            
                        }
                        Section{
                            TextField("Name" , text: $name)
                        }
                        Section{
                            HStack{
                                TextField("Quantity" , text:$quantity)
                                Picker( "", selection: $heightselection, content: {
                                    ForEach(heightOptions, id: \.self) {
                                        Text($0)
                                    }
                                })
                            }
                            
                        }
                        
                        Section{
                            HStack{
                                TextField("Price" , text:$price)
                                Picker( "", selection: $Currency, content: {
                                    ForEach(CurrencySymbol, id: \.self) {
                                        Text($0)
                                    }
                                })
                            }
                            
                        }
                        
                        
                    }
                    .background(Color.green)
                    
                    
                    
                    Button{
                        viewModel.uploadProduct(withCaption: name, quantity: quantity, type: type, heightselection: heightselection, price: price, Currency:Currency)
                        name = ""
                        type = ""
                        quantity = ""
                        price = ""
                        Currency = ""
                        heightselection = ""
                        
                    } label: {
                        Text("Save")
                            .bold()
                            .font(.title3)
                            .frame(width: 250, height: 40)
                            .foregroundColor(.white)
                    }
                    .background(Color.green)
                    .cornerRadius(10)
                }
                .navigationTitle("Add Product")
            }
     
    }
    }


struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
           
    }
}
