//
//  Recipe.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 23/12/2022.
//

import SwiftUI

struct Recipe: View {
    @State private var isSheetPresented = false
    @ObservedObject var viewModel = RecipeViewModel()
    var body: some View {
        NavigationView{
            VStack{
                ScrollView {
                    ForEach(viewModel.recipet){ recipe in
                        
                        Text("\(recipe.name)")
                            .font(.subheadline).bold()
                        Text("\(recipe.ingredients)")
                            .font(.caption)
                            .foregroundColor(.gray)
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
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isSheetPresented){
                NewRecipe()
                    
            }
        }
    }
}

struct Recipe_Previews: PreviewProvider {
    static var previews: some View {
        Recipe()
    }
}
