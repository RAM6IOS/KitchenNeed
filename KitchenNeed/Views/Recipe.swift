
//  Recipe.swift
//  KitchenNeed
//  Created by Bouchedoub Ramzi on 23/12/2022.
import SwiftUI
import Kingfisher
struct Recipe: View {
    @StateObject var viewModel = RecipeViewModel()
    @EnvironmentObject var viewModel2: AuthViewModel
    var body: some View {
        NavigationView{
            VStack{
                Searchbar(viewModel: viewModel)
                .padding(.horizontal, 10)
                Categoriesbar(viewModel: viewModel)
                ScrollView {
                    ForEach(viewModel.searchableRecipe){ recipe in
                        NavigationLink {
                            RecipeDetailsView(recipe: recipe)
                        } label: {
                            VStack(alignment: .leading, spacing: 0) {
                                RecipeCard(recipet: recipe)
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
