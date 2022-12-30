//
//  RecipeSetails.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 27/12/2022.
//

import SwiftUI
import Kingfisher

struct RecipeDetailsView: View {
    let recipe: Recipet

    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 0) {
                
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
                                //.font(.title3)
                                .foregroundColor(Color.cadcoler)
                            // .foregroundColor(Color.gray)
                    
                    
                    HStack(spacing: 10){
                        Image( "chef")
                            .resizable()
                            .scaledToFill()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .font(.system(size: 20))
                        Text("Diffyculty:")
                            .font(Font.system(size: 15))
                            .fontWeight(Font.Weight.heavy)
                        HStack {
                            
                            Text("Meduim")
                                .font(Font.custom("HelveticaNeue-Medium", size: 13))
                                .padding([.leading, .trailing], 10)
                                .padding([.top, .bottom], 5)
                                .foregroundColor(Color.white)
                        }
                        .background(Color.AccentColor)
                        .cornerRadius(7)
                        
                       
                        Text("Origin:")
                            .font(Font.system(size: 15))
                            .fontWeight(Font.Weight.heavy)
                        HStack {
                            
                            Text("Algerie")
                                .font(Font.custom("HelveticaNeue-Medium", size: 13))
                                .padding([.leading, .trailing], 10)
                                .padding([.top, .bottom], 5)
                                .foregroundColor(Color.white)
                        }
                        .background(Color.AccentColor)
                        .cornerRadius(7)
                    
                }
                    
                    ZStack{
                        Capsule()
                            .frame(height: 50)
                            .foregroundColor(Color.AccentColor)
                        
                        HStack(spacing: 15){
                            HStack(spacing: 10){
                                Image(systemName: "timer")
                                    .frame(width: 30, height: 30)
                                    .font(.system(size: 20))
                                    .background(Color.fontcoler)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                                VStack{
                                    Text("30m")
                                        .fontWeight(Font.Weight.heavy)
                                        .foregroundColor(Color.cadcoler)
                                    Text("Cook")
                                        .fontWeight(Font.Weight.heavy)
                                        .foregroundColor(Color.cadcoler)
                                    
                                }
                                
                                
                                
                            }
                            Spacer()
                                
                            HStack(spacing: 10){
                                Image(systemName: "flame.fill")
                                    .frame(width: 30, height: 30)
                                    .font(.system(size: 20))
                                    .background(Color.fontcoler)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                                VStack{
                                    Text("69C")
                                        .fontWeight(Font.Weight.heavy)
                                        .foregroundColor(Color.cadcoler)
                                    Text("degrees")
                                        .fontWeight(Font.Weight.heavy)
                                        .foregroundColor(Color.cadcoler)
                                }
                            }
                            
                            
                        }
                        .padding()
                    }
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
                    
                    
                    VStack(alignment: .leading){
                        Text("ingredients")
                            .fontWeight(Font.Weight.heavy)
                            .font(.title2)
                            
                            .foregroundColor(Color.cadcoler)
                        
                        Text("""
                        It's important to note that becoming the richest person in the world is an extremely rare and difficult feat, and itmay not be the best or most fulfilling goal for everyone. It's important to set goals that align with your values and interests, and to focus on building a life that brings you happiness and fulfillment.
                        """)
                        .foregroundColor(Color.gray)
                        
                    }
                    
                    VStack(alignment: .leading){
                        Text("ingredients")
                            .fontWeight(Font.Weight.heavy)
                            .font(.title2)
                            .foregroundColor(Color.cadcoler)
                        
                        Text("""
                        It's important to note that becoming the richest person in the world is an extremely rare and difficult feat, and itmay not be the best or most fulfilling goal for everyone. It's important to set goals that align with your values and interests, and to focus on building a life that brings you happiness and fulfillment.
                        """)
                        .foregroundColor(Color.gray)
                        
                    }
                        

                        
                        
                        
                        
                        // Horizontal Line separating details and price
                        //.HorizontalLine(color: Color.gray.opacity(0.3))
                        // .padding([.leading, .trailing], -12)
                        
                        
                    }
                }
                
                .padding(
                    .horizontal)
                .background(Color.white
                    .clipShape(SpecificCorners())
                    .padding(.top , -40)
                )
                
                
                //.clipped()
               
                
            }
            .background(Color.white)
            // .cornerRadius(15)
            // .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
            // .padding(.horizontal,10)
            Spacer()
            
            
        }

    }
    func path(in rect: CGRect)-> Path {
        let  path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft ,.topRight] , cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }

}


