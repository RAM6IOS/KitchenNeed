//
//  Profile.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 17/7/2022.

import SwiftUI
import CoreImage
import Kingfisher
struct Profile: View {
    @EnvironmentObject var viewModel2: AuthViewModel
    @ObservedObject var viewModel :fetchRecipeViewModel
    @State var ShowSettings = false
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var selectedImage: UIImage?
     @State private var profileImage: Image?
    @State private var showingImagePicker = false
    @State private var isMailViewShowing = false
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
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .padding(.top, 44)
                    Text(user.name)
                        .foregroundColor(Color.cadcoler)
                        .font(.title)
                        .fontWeight(Font.Weight.heavy)
                    
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
                                        Recipecard(recipet: recipet)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.vertical , 20)
                }
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





