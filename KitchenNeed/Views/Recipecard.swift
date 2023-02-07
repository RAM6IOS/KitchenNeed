//
//  Recipecard.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 21/1/2023.
//

import SwiftUI
import Kingfisher

struct Recipecard: View {
   var recipet : Recipet
    var body: some View {
        VStack{
            ZStack(alignment: .bottomLeading) {
                KFImage(URL(string: recipet.recipetImageUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 250)
                Text("\(recipet.name)")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .padding(12)
            }
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
    }
}

