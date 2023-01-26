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
               
            }
            .padding(12)
       
        
    }
}

