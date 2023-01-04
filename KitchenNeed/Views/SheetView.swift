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
    let types = ["vegetable", "meat","seafood", "fruits", "bread" , "milk","dairy-products" ,"spice" ,"canned-food" ,"snacks","cleaning-materials","PersonalHygiene","stationery"]
    @State private var type = "vegetable"
    var heightOptions = ["L","mL", "kg" ,"g"]
    @State private var heights = "L"
    @State private var price = ""
    @State private var currency = "$"
    var currencySymbol = ["$","€", "£" ,"¥"]
    let types2 = ["L","mL", "kg" ,"g"]
    @State private var type2 = "L"
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
                                Picker("type", selection: $type) {
                                    ForEach(types, id: \.self) { typ in
                                        HStack( spacing: 10){
                                            Text(typ)
                                            
                                        }
                                    }
                                }
                                
                            }
                        }
                        Section("Product Name"){
                            TextField("Name" , text: $name)
                        }
                        Section("Product Quantity"){
                            HStack{
                                TextField("Quantity" , text:$quantity )
                                Picker("", selection: $heights) {
                                    ForEach(heightOptions, id: \.self) { typ in
                                        HStack( spacing: 10){
                                            Text(typ)
                                            
                                        }
                                    }
                                }
                                }
                                
                            }
                        Section("Product Price"){
                            HStack{
                                TextField("Price" , text:$price)
                                
                                Picker("", selection: $currency) {
                                    ForEach(currencySymbol, id: \.self) { typ in
                                        HStack( spacing: 10){
                                            Text(typ)
                                            
                                        }
                                    }
                                }
                              
                               
                            }
                            
                        }
                        
                        }
                    Button{
                        viewModel.uploadProduct(withCaption: name, quantity: quantity, type: type ,currency:currency, price :price ,heights:heights ,type2:type2)
                        name = ""
                        type = ""
                        quantity = ""
                       type2 = ""
                        
                    } label: {
                        Text("Save")
                            .bold()
                            .font(.title3)
                            .frame(width: 350, height: 40)
                            .foregroundColor(.black)
                    }
                    .background(Color.AccentColor)
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
