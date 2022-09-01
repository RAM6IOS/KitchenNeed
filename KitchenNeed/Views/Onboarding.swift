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
            SignupView(ShowOnboarding: $ShowOnboarding)
        
        }
          .tabViewStyle(PageTabViewStyle())
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding(ShowOnboarding: .constant(true))
    }
}
