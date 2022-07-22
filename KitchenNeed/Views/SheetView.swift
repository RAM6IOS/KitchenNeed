//
//  SheetView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 18/7/2022.
//

import SwiftUI

struct SheetView: View {
    @State private var name = ""
    @State private var price = ""
    @State private var  details = ""
    let types = ["vegetables🥬", "meat🥩", "fruit🍎", "Bread🥖", "juice🧃", "Soft drinks🍾", "baked sweets🥐" , "sweets🍭","Legume🥜" , "Vegetable Oil🥃" , "Milk🥛" ,"Cheese🧀" , "Dairy products","spices" ,"Legume🥜" , "Vegetable Oil🥃" , "Milk🥛" ,"Cheese🧀" , "Dairy products"]
    @State private var type = ""
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Section("Types"){
                Picker("types", selection: $type) {
                                ForEach(types, id: \.self) {
                                    Text($0)
                                }
                            }
                    }
                    Section{
                TextField("Name" , text: $name)
                    }
                    Section{
                TextField("price" , text:$price)
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
