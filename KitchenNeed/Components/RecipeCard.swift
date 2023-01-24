//
//  RecipeCard.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 24/1/2023.
//

import SwiftUI
import Kingfisher

struct RecipeCard: View {
    @State var recipet : Recipet
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            KFImage(URL(string: recipet.recipetImageUrl))
                .resizable()
                .scaledToFill()
                .frame(minWidth: nil, idealWidth: nil, maxWidth: UIScreen.main.bounds.width, minHeight: nil, idealHeight: nil, maxHeight: 250, alignment: .center)
                .clipped()
            VStack(alignment: .leading, spacing: 6) {
                HStack{
                   
                    Text(recipet.name)
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
                        Text("\(recipet.categorie)")
                            .font(Font.custom("HelveticaNeue-Medium", size: 13))
                            .padding([.leading, .trailing], 10)
                            .padding([.top, .bottom], 5)
                            .foregroundColor(Color.cadcoler)
                            
                    }
                    .background(Color.AccentColor)
                    .cornerRadius(7)
                }
                if let user = recipet.user {
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

