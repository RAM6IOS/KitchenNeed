//
//  Recipe.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 23/12/2022.
//

import SwiftUI
import Kingfisher

struct Recipe: View {
    @State private var isSheetPresented = false
    @ObservedObject var viewModel = RecipeViewModel()
    @State var text =  ""
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    TextField("Search ...", text: $viewModel.searchText)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 8)
                            }
                        )
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                       
                }
                .padding(.horizontal, 10)
                ScrollView {
                    ForEach(viewModel.searchableRecipe){ recipe in
                        NavigationLink {
                            RecipeDetailsView(recipe: recipe)
                        } label: {
                            
                            VStack(alignment: .leading, spacing: 0) {
                                KFImage(URL(string: recipe.recipetImageUrl))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: nil, idealWidth: nil, maxWidth: UIScreen.main.bounds.width, minHeight: nil, idealHeight: nil, maxHeight: 300, alignment: .center)
                                    .clipped()
                                VStack(alignment: .leading, spacing: 6) {
                                    HStack{
                                       
                                        Text(recipe.name)
                                            .foregroundColor(Color.cadcoler)
                                            .font(.title)
                                            .fontWeight(Font.Weight.heavy)
                                    }
                                    HStack{
                                        Text("Category:")
                                            .font(Font.system(size: 15))
                                            .foregroundColor(Color.cadcoler)
                                            .fontWeight(Font.Weight.heavy)
                                        HStack {
                                            Text("Soups")
                                                .font(Font.custom("HelveticaNeue-Medium", size: 13))
                                                .padding([.leading, .trailing], 10)
                                                .padding([.top, .bottom], 5)
                                                .foregroundColor(Color.cadcoler)
                                                
                                        }
                                        .background(Color.AccentColor)
                                        .cornerRadius(7)
                                    }
                                    if let user = recipe.user {
                                        HStack{
                                            Image( "cook")
                                                .resizable()
                                                .scaledToFill()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 30, height: 30)
                                                .font(.system(size: 20))
                                                KFImage(URL(string: user.profileImageUrl ))
                                                    .resizable()
                                                    .scaledToFill()
                                                    .clipShape(Circle())
                                                    .frame(width: 30, height: 30)
                                            Text(user.name)
                                                .foregroundColor(Color.cadcoler)
                                                .fontWeight(Font.Weight.heavy)
                                        }
                                    }
                                }
                                .padding(12)
                            }
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
                            .padding(.horizontal,10)
                        }
                    }
                }
            }
            .navigationBarTitle("Recipe")
            .toolbar {
                ToolbarItem( placement: .navigationBarTrailing) {
                    
                    Button(action: {isSheetPresented.toggle()}) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.AccentColor)
                    }
                    
                }
                ToolbarItem( placement: .navigationBarLeading) {
                    /*
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 30, height: 30)
                     */
                    
                }
                
            }
            .sheet(isPresented: $isSheetPresented){
                NewRecipe()
                    
            }
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct Recipe_Previews: PreviewProvider {
    static var previews: some View {
        Recipe()
    }
}
