//
//  Diffyculty.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 3/2/2023.
//

import SwiftUI

struct Diffyculty: View {
    var recipeitem:String
    var body: some View {
        VStack{
            HStack(spacing: 5){
                Image("chef")
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
                Text("Diffyculty:")
                    .font(Font.system(size: 15))
                    .fontWeight(Font.Weight.heavy)
                HStack {
                    Text(recipeitem)
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
    }
}


