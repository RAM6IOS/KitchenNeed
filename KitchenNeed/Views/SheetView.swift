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
    @State private var type = ""
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Section("Types"){
                Picker("types", selection: $type) {
                                ForEach(types, id: \.self) { typ in
                                    HStack( spacing: 10){
                                    Image(typ)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 70, height: 70)
                                    Text(typ)
                                    }
                                }
                            }
                    }
                    Section{
                TextField("Name" , text: $name)
                    }
                    Section{
                TextField("price" , text:$quantity)
                    }
                    Section("Details"){
                TextEditor( text: $details)
                    .foregroundColor(Color.gray)
                    .font(.custom("HelveticaNeue", size: 13))
                    .lineSpacing(5)
                    .frame(width: 300, height: 250)
                    }
                
                }
                Button{
                    
                    let newProduct = Product(context: moc)
                    newProduct.type = type
                    newProduct.name = name
                    newProduct.quantity = quantity
                    newProduct.details = details
                    try? moc.save()
                    
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
