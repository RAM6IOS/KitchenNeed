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
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
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
                        .font(Font.system(size: 25))
                        .fontWeight(Font.Weight.heavy)
                        .padding(.horizontal ,10)
                    ScrollView{

                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.recipet){ recipet in
                                NavigationLink {
                                    RecipeDetailsProfile(recipe: recipet)
                                } label: {
                                    VStack{
                                        ZStack(alignment: .bottomLeading) {
                                            KFImage(URL(string: recipet.recipetImageUrl))
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 180, height: 250)
                                            Text("Khas Khas And Gud Ki Panjiri")
                                                .font(.headline)
                                                .fontWeight(.medium)
                                                .foregroundColor(Color.white)
                                                .padding(12)
                                            
                                        }
                                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                        
                                    }
                                }
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
        .accentColor(Color(.white))
    }
    
}





