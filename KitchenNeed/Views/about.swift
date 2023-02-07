//
//  about.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 20/1/2023.
//

import SwiftUI
import MessageUI

struct about: View {
    var body: some View {
        VStack{
            Image("1024")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .padding(.top, 44)
            Text("About")
                .fontWeight(Font.Weight.heavy)
                .font(.system(size: 40))
                .foregroundColor(Color.cadcoler)
            Text("KitchenNeed")
                .fontWeight(Font.Weight.heavy)
                .font(.system(size: 30))
                .foregroundColor(Color.cadcoler)
            Text("""
 Meet the KitchenNeed app:your ultimate culinary sidekick. With the app, you can publish your own tasty food recipes to share with our global community of hungry home cooks. It’s easy to use and offers a variety of irresistibly tasty and healthy recipes that appeal to beginners and experts alike, create shopping lists. Ready to start cooking and baking?
""")
            .padding()
            Spacer()
        }
    }
    
    
}



