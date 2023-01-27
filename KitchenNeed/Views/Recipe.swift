
//  Recipe.swift
//  KitchenNeed
//  Created by Bouchedoub Ramzi on 23/12/2022.
import SwiftUI
import Kingfisher
struct Recipe: View {
    @ObservedObject var viewModel = RecipeViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                Searchbar(searchText: viewModel.searchText)
                ScrollView(.horizontal, showsIndicators: false) {
                            HStack() {
                                ForEach(viewModel.categories, id: \.self) { item in
                                Text(item)
                                    .padding(7)
                                    .padding(.horizontal)
                                    .background(
                                            Rectangle()
                                            .cornerRadius(8)
                                            .foregroundColor(Color.AccentColor)
                                         .opacity(1/4)
                                                )
                                    .onTapGesture {
                                        if item == "all" {
                                            viewModel.searchText2 = ""
                                        } else {
                                            viewModel.searchText2 = item
                                        }
                                        print("tttt\( viewModel.searchText2)")
                                }
                            }
                            }
                        }
                ScrollView {
                    ForEach(viewModel.searchableRecipe){ recipe in
                        NavigationLink {
                            RecipeDetailsView(recipe: recipe)
                            //RecipeDetailsProfile(recipe: recipe)
                        } label: {
                            VStack(alignment: .leading, spacing: 0) {
                                RecipeCard(recipet: recipe)
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
                                    .padding(.horizontal,11)
                                    .padding(.bottom ,8)
                                }
                               
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
                    Button(action: {viewModel.isSheetPresented.toggle()}) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.AccentColor)
                    }
                }
            }
            .sheet(isPresented: $viewModel.isSheetPresented){
                NewRecipe()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(Color(.white))
    }
}
