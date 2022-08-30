//
//  Onboarding.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 30/8/2022.
//

import SwiftUI

struct Onboarding: View {
    @Binding  var ShowOnboarding :Bool
    var body: some View {
        TabView{
            VStack{
            Image("default-avatar")
                .frame(width: 300, height: 300)
            }
            .background(.black)
            VStack{
            Text("And since that ? you were working on the projects you mentioned in the CV right ?")
                .foregroundColor(.blue)
                .padding()
                Button{
                    ShowOnboarding.toggle()
                } label: {
                    Text("Get Started")
                        .frame(width: 200, height: 59)
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
          .tabViewStyle(PageTabViewStyle())
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding(ShowOnboarding: .constant(true))
    }
}
