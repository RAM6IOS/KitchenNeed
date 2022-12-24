//
//  NewRecipe.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 23/12/2022.
//

import SwiftUI

struct NewRecipe: View {
    @State private var name = ""
    @State private var definition = ""
    @State private var ingredients = ""
    @State private var preparation  = ""
    @State private var time = ""
    @State private var degree = ""
    @ObservedObject var viewModel = NewRecipeViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
            
                if #available(iOS 16.0, *) {
                    Form{
                        Section{
                            TextField("Name", text: $name)
                        }
                        Section("Definition"){
                            TextEditor(text: $definition)
                                //.font(.title)
                                .lineSpacing(20)
                                .autocapitalization(.words)
                                .frame(height: 100)
                                .disableAutocorrection(true)
                                .padding()
                        }
                        Section("Ingredients"){
                            TextEditor(text: $ingredients)
                               // .font(.title)
                                //.lineSpacing(20)
                                //.autocapitalization(.words)
                                .frame(minHeight: 100)
                                //.disableAutocorrection(true)
                                //.padding()
                        }
                        Section("Preparation"){
                            TextEditor(text: $preparation)
                                //.font(.title)
                                .lineSpacing(20)
                                .autocapitalization(.words)
                                .frame(height: 100)
                                .disableAutocorrection(true)
                                .padding()
                        }
                        Section{
                            TextField("Time" ,text:$time)
                        }
                        Section{
                            TextField("Degree" ,text:$degree)
                        }
                        
                    }
                    .scrollContentBackground(.hidden)
                } else {
                    // Fallback on earlier versions
                }
                   
                
                
                Button{
                    viewModel.uploadRecipe(withCaption: name, definition: definition, ingredients: ingredients, degree: degree, time: time, preparation: preparation)
                    
                    
                    
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
            .navigationBarTitle("New Recipe")
               
                
            }
        }
    }


struct NewRecipe_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipe()
    }
}
