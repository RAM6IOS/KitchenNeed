//
//  RecipeSetails.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 27/12/2022.
//

import SwiftUI
import Kingfisher

struct RecipeDetailsView: View {
    let recipe: Recipet

    var body: some View {
        VStack {
            // Display the name of the recipe at the top
            Text(recipe.name)
                .font(.largeTitle)
                .padding()

            // Display the recipe image
            KFImage(URL(string: recipe.recipetImageUrl))
                .resizable()
                .scaledToFill()
                .frame(minWidth: nil, idealWidth: nil, maxWidth: UIScreen.main.bounds.width, minHeight: nil, idealHeight: nil, maxHeight: 300, alignment: .center)
                .clipped()
            
            Text(recipe.name)
                .font(.largeTitle)
                .padding()

            // Display the preparation time and temperature
            HStack {
                Text("Preparation time: \(recipe.time) minutes")
                    .font(.headline)
                Spacer()
                Text("Cooking temperature: \(recipe.degree)°C")
                    .font(.headline)
            }
            .padding()

            // Display the ingredients and instructions in a list
            List {
                Section(header: Text("Ingredients")) {
                    
                        Text(recipe.ingredients)
                            .font(.largeTitle)
                            .padding()
                    
                }

                Section(header: Text("Instructions")) {
                    
                        Text(recipe.definition)
                            .font(.largeTitle)
                            .padding()
                    
                }
            }
        }
    }
}


