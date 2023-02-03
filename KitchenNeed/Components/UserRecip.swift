//
//  UserRecip.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 3/2/2023.
//

import SwiftUI
import Kingfisher

struct UserRecip: View {
    let recipe: Recipet
    var body: some View {
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
    }
}

