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
    @State private var showingPicker = false
    @State var currentPage = 0
    var body: some View {
        GeometryReader(content: { geometry in
        VStack{
        TabView(selection: $currentPage){
            IntroView(name: "Create and save your shopping list", image:"groceries" )
                .tag(0)
            IntroView(name: "Analyze your purchase & spending patterns", image: "grocery")
                .tag(1)
            GetStarted(ShowOnboarding: $ShowOnboarding)
                .tag(2)
        }
          .tabViewStyle(PageTabViewStyle())
          .indexViewStyle(.page(backgroundDisplayMode: .always))
            if currentPage == 2 {
                VStack{
                    Button{
                        withAnimation{
                        ShowOnboarding.toggle()
                        }
                    } label:
                     {
                        Text("Get Started")
                            .bold()
                            .font(.title3)
                            .frame(width: 350, height: 50)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(30)
                        }
                }
            }
            HStack{
                if currentPage > 0 {
                    Button{
                        withAnimation{
                        currentPage -= 1
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                            .padding()
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .background(Color.green)
                            .clipShape(Circle())
                    }
                }
                Spacer()
                if   currentPage <= 1{
                Button{
                    withAnimation{
                    if currentPage != 2 {
                        currentPage += 1
                    }
                    }
                } label: {
                     Image(systemName: "arrow.right")
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .background(Color.green)
                    .clipShape(Circle())
                }
                }
            }
            .padding(.horizontal)
            .padding(.horizontal)
            Spacer()
    }
        })
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        Onboarding(ShowOnboarding: .constant(true))
        }
    }
}
