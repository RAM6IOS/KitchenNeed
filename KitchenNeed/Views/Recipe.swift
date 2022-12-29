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
    var body: some View {
        NavigationView{
            VStack{
                ScrollView {
                    ForEach(viewModel.recipet){ recipe in
                        NavigationLink {
                            RecipeDetailsView(recipe: recipe)
                        } label: {
                            
                            VStack(alignment: .leading, spacing: 0) {
                                
                                KFImage(URL(string: recipe.recipetImageUrl))
                                //.resizable()
                                //.aspectRatio(contentMode: .fit)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: nil, idealWidth: nil, maxWidth: UIScreen.main.bounds.width, minHeight: nil, idealHeight: nil, maxHeight: 300, alignment: .center)
                                    .clipped()
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(recipe.name)
                                        .fontWeight(Font.Weight.heavy)
                                    // .foregroundColor(Color.gray)
                                    HStack{
                                        Text("Based on:")
                                            .font(Font.system(size: 15))
                                            .fontWeight(Font.Weight.heavy)
                                        HStack {
                                            Text("category")
                                                .font(Font.custom("HelveticaNeue-Medium", size: 13))
                                                .padding([.leading, .trailing], 10)
                                                .padding([.top, .bottom], 5)
                                                .foregroundColor(Color.white)
                                        }
                                        .background(Color(red: 43/255, green: 175/255, blue: 187/255))
                                        .cornerRadius(7)
                                    }
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
                                    
                                    
                                    
                                    
                                    // Horizontal Line separating details and price
                                    //.HorizontalLine(color: Color.gray.opacity(0.3))
                                    // .padding([.leading, .trailing], -12)
                                    
                                    
                                    
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
                            .foregroundColor(.iconcoler)
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
