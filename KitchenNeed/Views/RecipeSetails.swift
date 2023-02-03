//
//  RecipeSetails.swift
//  KitchenNeed
//  Created by Bouchedoub Ramzi on 27/12/2022.
import SwiftUI
import Kingfisher
import Firebase

struct RecipeDetailsView: View {
    let recipe: Recipet
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 10) {
                ImageCared(image:recipe.recipetImageUrl)
                ScrollView(.vertical , showsIndicators: false){
                VStack(alignment: .leading, spacing: 6) {
                            Text(recipe.name)
                                .fontWeight(Font.Weight.heavy)
                                .font(.system(size: 40))
                                .foregroundColor(Color.cadcoler)
                    VStack{
                        if let user = recipe.user {
                            HStack{
                                KFImage(URL(string: user.profileImageUrl ))
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 30, height: 30)
                                Text(user.name)
                                    .fontWeight(Font.Weight.heavy)
                            }
                        }
                    }
                    Diffyculty(recipeitem: "\(recipe.difficulty)")
                    ZStack{
                        Capsule()
                            .frame(height: 50)
                            .foregroundColor(Color.AccentColor)
                        HStack{
                            ExtractedView(nameicons: "square.stack.3d.up", recipeitem: recipe.categorie)
                            Spacer()
                            ExtractedView(nameicons: "timer", recipeitem: "\(recipe.hours)h:\(recipe.minutes)m")
                            Spacer()
                            ExtractedView(nameicons: "flame.fill", recipeitem: "\(recipe.degree)\(recipe.temperatures)")
                        }
                        .padding(.horizontal , 10)
                        .padding(.vertical , 10)
                    }
                    if recipe.definition.isEmpty {
                    }else{
                        DefinitionRecpe(recipeitem: recipe.definition, titel: "Definition")
                    }
                    DefinitionRecpe(recipeitem: recipe.ingredients, titel: "Ingredients")
                    DefinitionRecpe(recipeitem: recipe.preparation, titel: "Preparation")
                    }
                }
                .padding(
                    .horizontal)
                .background(Color.white
                    .clipShape(SpecificCorners())
                    .padding(.top , -30)
                )
            }
            .ignoresSafeArea(edges: .top)
            .background(Color.white)
            Spacer()
        }
    }
}


