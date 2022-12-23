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
                        Section{
                            TextField("Name" , text: $name)
                        }
                        Section{
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
                        Section{
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
                        //price = ""
                       // currency = ""
                        //heightselection = ""
                        
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
                    .background(Color.green)
              
                    
                }
                .navigationTitle("Add Product")
            }
     
    }



struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
           
    }
}
