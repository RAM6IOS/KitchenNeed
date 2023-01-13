//
//  EditProduct.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 13/1/2023.
//

import SwiftUI

struct EditProduct: View {
    @ObservedObject var viewModel2 : EditProductiVewModel
    @Environment(\.presentationMode) var presentationMode
    init( recipet: Recipet){
      
        self.viewModel2 = EditProductiVewModel(recipe: recipet)
    }
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section("Recipe Name"){
                        TextField("name", text:$viewModel2.recipe.name )
                    }
                    Section("Definition"){
                        TextEditor( text:$viewModel2.recipe.definition)
                    }
                    Section("Ingredients"){
                        TextEditor( text:$viewModel2.recipe.ingredients)
                    }
                    Section("Time"){
                        TextField("Time", text:$viewModel2.recipe.time)
                    }
                    Section("Degree"){
                        TextField("Degree", text:$viewModel2.recipe.degree)
                    }
                    Button{
                        viewModel2.EditProducti()
                        
                    } label: {
                        Text("Save")
                            .bold()
                            .font(.title3)
                            .frame(width: 350, height: 40)
                            .foregroundColor(Color.backcoler)
                    }
                    .background(Color.AccentColor)
                    .cornerRadius(10)
                }
                
            }
            .navigationTitle("Edit Product")
            .toolbar {
                ToolbarItem( placement: .navigationBarLeading) {
                    Button(action: {presentationMode.wrappedValue.dismiss()}) {
                        HStack{
                            Image(systemName: "arrow.left")
                                .font(.system(size: 20))
                            Text("Close")
                                .font(.system(size: 20))
                                .foregroundColor(.AccentColor)
                        }
                    }
                }
            }
        }
    }
}




