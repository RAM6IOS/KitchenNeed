
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
                        } label: {
                            RecipeCard(recipet: recipe)
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
