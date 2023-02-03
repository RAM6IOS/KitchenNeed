//
//  ExtractedView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 3/2/2023.
//

import SwiftUI

struct ExtractedView: View {
    var nameicons:String
    var recipeitem:String
    var body: some View {
        HStack(spacing: 5){
            Image(systemName: nameicons)
                .frame(width: 30, height: 30)
                .font(.system(size: 20))
                .background(Color.fontcoler)
                .foregroundColor(.white)
                .clipShape(Circle())
            VStack{
                Text("\(recipeitem)")
                    .fontWeight(Font.Weight.heavy)
                    .foregroundColor(Color.cadcoler)
            }
        }
    }
}


