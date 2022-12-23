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
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    TextField("Name", text: $name)
                    TextEditor(text: $definition)
                        .font(.title)
                        .lineSpacing(20)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                        .padding()
                    TextEditor(text: $ingredients)
                        .font(.title)
                        .lineSpacing(20)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                        .padding()
                    TextEditor(text: $preparation)
                        .font(.title)
                        .lineSpacing(20)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                        .padding()
                    TextField("Time" ,text:$time)
                    
                    TextField("Time" ,text:$degree)
                }
                
            }
        }
    }
}

struct NewRecipe_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipe()
    }
}
