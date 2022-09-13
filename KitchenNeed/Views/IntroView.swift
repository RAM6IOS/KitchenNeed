//
//  IntroView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 2/9/2022.
//

import SwiftUI

struct IntroView: View {
    @State var name : String
    @State var image: String
    var body: some View {
        VStack{
            Text(name)
                .font(
                        .system(size: 20)
                        .weight(.heavy)
                    )
                .padding(.vertical , 20)
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250 )
        }
    }
}


