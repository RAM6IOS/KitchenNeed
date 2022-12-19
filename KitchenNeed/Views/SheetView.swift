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
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var prospects: Prospects
    @ObservedObject var viewModel = UploadProductViewModel()
    var body: some View {
        NavigationView{
           
                VStack{
                    Form{
                        Section("Types"){
                            Picker("types", selection: $type) {
                                ForEach(types, id: \.self) { typ in
                                    HStack( spacing: 10){
                                        Text(typ)
                                    }
                                }
                            }
                            Image(type)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .cornerRadius(12)
                            
                        }
                        Section{
                            TextField("Name" , text: $name)
                        }
                        Section{
                            TextField("price" , text:$quantity)
                        }
                    }
                    .background(Color(red: 32/255, green: 36/255, blue: 38/255))
                    
                    Button{
                        viewModel.uploadProduct(withCaption: name, quantity: quantity, type: type)
                        quantity = ""
                        name = ""
                        type = ""
                        
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
