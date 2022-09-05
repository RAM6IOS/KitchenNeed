//
//  Onboarding.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 30/8/2022.
//

import SwiftUI
import CoreMIDI
struct Onboarding: View {
    @Binding  var ShowOnboarding :Bool
    @State var currentPage = 0
    var body: some View {
        GeometryReader(content: { geometry in
        VStack{
        TabView(selection: $currentPage){
            IntroView(name: "Create and save your shopping list", image:"groceries" )
                .tag(0)
            IntroView(name: "Analyze your purchase & spending patterns", image: "grocery")
                .tag(1)
    SignupView(ShowOnboarding: $ShowOnboarding)
                .tag(2)
        }
          .tabViewStyle(PageTabViewStyle())
          .indexViewStyle(.page(backgroundDisplayMode: .always))
            HStack{
                if currentPage > 0 {
                    Button{
                        currentPage -= 1
                    } label: {
                        Text("back")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    
                }
                if   currentPage <= 1{
                Button{
                    if currentPage != 2 {
                        currentPage += 1
                    }
                } label: {
                    HStack{
                        Text( "Next")
                            
                     Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: 150, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                }
                }
            }
            Spacer()
    }
        })
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding(ShowOnboarding: .constant(true))
    }
}
