//
//  RecipeDetailsProfile.swift
//  KitchenNeed
//  Created by Bouchedoub Ramzi on 12/1/2023.
import SwiftUI
import Kingfisher
import Firebase

struct RecipeDetailsProfile: View {
    let recipe: Recipet
    @Environment(\.presentationMode) var presentationMode
    @State var showingedit = false
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
                    UserRecip(recipe:recipe)
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
            .fullScreenCover(isPresented:$showingedit, content: {
                EditProduct( recipet: recipe)
            })
            .toolbar {
                ToolbarItem( placement: .navigationBarTrailing) {
                    Menu {
                        Button{
                            DliteItem.dlite(id:recipe.id ?? "1")
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        Button{
                            showingedit.toggle()
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                    } label: {
                        Button(action: {}) {
                            if #available(iOS 16.0, *) {
                                Image(systemName: "ellipsis")
                                    .font(.system(size: 20))
                                    .fontWeight(Font.Weight.heavy)
                                    .foregroundColor(.white)
                            } else {
                                // Fallback on earlier versions
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
            .background(Color.white)
            Spacer()
        }
    }
}

