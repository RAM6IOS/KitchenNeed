//
//  RecipeSetails.swift
//  KitchenNeed
//  Created by Bouchedoub Ramzi on 27/12/2022.
import SwiftUI
import Kingfisher
import Firebase

struct RecipeDetailsView: View {
    let recipe: Recipet
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 10) {
                KFImage(URL(string: recipe.recipetImageUrl))
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: nil, idealWidth: nil, maxWidth: UIScreen.main.bounds.width, minHeight: nil, idealHeight: nil, maxHeight: 300, alignment: .center)
                    .clipped()
                ScrollView(.vertical , showsIndicators: false){
                VStack(alignment: .leading, spacing: 6) {
                            Text(recipe.name)
                                .fontWeight(Font.Weight.heavy)
                                .font(.system(size: 40))
                                .foregroundColor(Color.cadcoler)
                    VStack{
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
                    }
                    VStack{
                        HStack(spacing: 5){
                            Image( "chef")
                                .resizable()
                                .scaledToFill()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 20)
                                .font(.system(size: 20))
                            Text("Diffyculty:")
                                .font(Font.system(size: 15))
                                .fontWeight(Font.Weight.heavy)
                            HStack {
                                Text("\(recipe.difficulty)")
                                    .font(Font.custom("HelveticaNeue-Medium", size: 13))
                                    .padding([.leading, .trailing], 10)
                                    .padding([.top, .bottom], 5)
                                    .foregroundColor(Color.cadcoler)
                            }
                            .background(Color.AccentColor)
                            .cornerRadius(7)
                        }
                    }
                    .padding(.vertical , 10)
                    ZStack{
                        Capsule()
                            .frame(height: 50)
                            .foregroundColor(Color.AccentColor)
                        HStack{
                            HStack(spacing: 5){
                                Image(systemName: "square.stack.3d.up")
                                    .frame(width: 30, height: 30)
                                    .font(.system(size: 20))
                                    .background(Color.fontcoler)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                                VStack{
                                    Text("\(recipe.categorie)")
                                        .fontWeight(Font.Weight.heavy)
                                        .foregroundColor(Color.cadcoler)
                                }
                            }
                            Spacer()
                            HStack(spacing: 5){
                                Image(systemName: "timer")
                                    .frame(width: 30, height: 30)
                                    .font(.system(size: 20))
                                    .background(Color.fontcoler)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                                VStack{
                                    Text("\(recipe.hours)h:\(recipe.minutes)m")
                                        .fontWeight(Font.Weight.heavy)
                                        .foregroundColor(Color.cadcoler)
                                }
                            }
                            Spacer()
                            HStack(spacing: 5){
                                Image(systemName: "flame.fill")
                                    .frame(width: 30, height: 30)
                                    .font(.system(size: 20))
                                    .background(Color.fontcoler)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                                VStack{
                                    Text("\(recipe.degree)\(recipe.temperatures)")
                                        .fontWeight(Font.Weight.heavy)
                                        .foregroundColor(Color.cadcoler)
                                }
                            }
                        }
                        .padding(.horizontal , 10)
                        .padding(.vertical , 10)
                    }
                    if recipe.definition.isEmpty {
                        
                    }else{
                        VStack(alignment: .leading ,spacing: 10){
                            Text("Definition")
                                .fontWeight(Font.Weight.heavy)
                                .font(.title2)
                                .foregroundColor(Color.cadcoler)
                            Text(recipe.definition)
                                .foregroundColor(Color.cadcoler)
                        }
                         .padding(.vertical ,15)
                    }
                    VStack(alignment: .leading ,spacing: 10){
                        Text("Ingredients")
                            .fontWeight(Font.Weight.heavy)
                            .font(.title3)
                            .foregroundColor(Color.cadcoler)
                        Text(recipe.ingredients)
                        .foregroundColor(Color.cadcoler)
                    }
                    .padding(.vertical ,15)
                    VStack(alignment: .leading , spacing: 10){
                        Text("Preparation")
                            .fontWeight(Font.Weight.heavy)
                            .font(.title3)
                            .foregroundColor(Color.cadcoler)
                        Text(recipe.preparation)
                        .foregroundColor(Color.cadcoler)
                    }
                    .padding(.vertical ,15)
                    
                    }
                }
                .padding(
                    .horizontal)
                .background(Color.white
                    .clipShape(SpecificCorners())
                    .padding(.top , -30)
                )
            }
            .ignoresSafeArea(edges: .top)
            .background(Color.white)
            Spacer()
        }
    }
}
