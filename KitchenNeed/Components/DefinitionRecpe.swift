//
//  DefinitionRecpe.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 3/2/2023.
//

import SwiftUI

struct DefinitionRecpe: View {
    var recipeitem:String
    var titel:String
    var body: some View {
        VStack(alignment: .leading ,spacing: 10){
            Text(titel)
                .fontWeight(Font.Weight.heavy)
                .font(.title2)
                .foregroundColor(Color.cadcoler)
            Text(recipeitem)
                .foregroundColor(Color.cadcoler)
        }
         .padding(.vertical ,15)
    }
}


