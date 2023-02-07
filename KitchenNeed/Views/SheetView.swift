//
//  SheetView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 18/7/2022.
//
import SwiftUI
struct SheetView: View {
    @ObservedObject var viewModel = UploadProductViewModel()
    var body: some View {
        NavigationView{
                VStack{
                    Form{
                        Section("Types"){
                            HStack{
                                Image(viewModel.type)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(12)
                                Picker("type", selection: $viewModel.type) {
                                    ForEach(viewModel.types, id: \.self) { typ in
                                        HStack( spacing: 10){
                                            Text(typ)
                                        }
                                    }
                                }
                            }
                        }
                        Section("Product Name"){
                            TextField("Name" , text: $viewModel.name)
                        }
                        Section("Product Quantity"){
                            HStack{
                                TextField("Quantity" , text:$viewModel.quantity )
                                Picker("", selection: $viewModel.heights) {
                                    ForEach(viewModel.heightOptions, id: \.self) { typ in
                                        HStack( spacing: 10){
                                            Text(typ)
                                            
                                        }
                                    }
                                }
                                }
                            }
                        Section("Product Price"){
                            HStack{
                                TextField("Price" , text:$viewModel.price)
                                Picker("", selection: $viewModel.currency) {
                                    ForEach(viewModel.currencySymbol, id: \.self) { typ in
                                        HStack( spacing: 10){
                                            Text(typ)
                                            
                                        }
                                    }
                                }
                            }
                        }
                        
                        }
                    Button{
                        viewModel.uploadProduct(withCaption: viewModel.name, quantity: viewModel.quantity, type: viewModel.type ,currency:viewModel.currency, price :viewModel.price ,heights:viewModel.heights ,type2: viewModel.heights)
                        viewModel.name = ""
                        viewModel.type = ""
                        viewModel.quantity = ""
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
