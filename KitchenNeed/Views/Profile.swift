//
//  Profile.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 17/7/2022.
//

import SwiftUI
import CoreImage
import Kingfisher

struct Profile: View {
    @EnvironmentObject var viewModel2: AuthViewModel
    @ObservedObject var viewModel :fetchRecipeViewModel
    @ObservedObject var viewModel3 = RecipeViewModel()
    @State var ShowSettings = false
    init(user:User){
        self.viewModel = fetchRecipeViewModel(user: user)
    }
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel2.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                    Text(user.name)
                        .foregroundColor(Color.cadcoler)
                        .font(.title)
                        .fontWeight(Font.Weight.heavy)
                }
                
                
                VStack(alignment: .leading){
                    Text("My Recipes")
                        .foregroundColor(Color.cadcoler)
                        .font(Font.system(size: 30))
                        .fontWeight(Font.Weight.heavy)
                        .padding(.horizontal ,10)
                    ScrollView{
                        ForEach(viewModel.recipet){ recipe in
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
                .padding(.vertical , 20)
                
                /*Button{
                    viewModel2.logout()
                } label: {
                    Text("Edit")
                        .bold()
                        .font(.title3)
                        .frame(width: 350, height: 40)
                        .foregroundColor(.white)
                }
                .background(Color.green)
                .cornerRadius(10)*/
                
                
                }
            .fullScreenCover(isPresented:$ShowSettings, content: {
                          SettingsView()
                            })
            .toolbar {
                ToolbarItem( placement: .navigationBarTrailing) {
                    Button(action: {ShowSettings.toggle()}) {
                        Image(systemName: "gearshape")
                            .font(.system(size: 25))
                            .foregroundColor(.AccentColor)
                            
                    }
                    
                }
                
                
            }
            .navigationTitle("Profile")
           
            
        }
    }
    
}





