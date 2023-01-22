//
//  Onboarding.swift
//  KitchenNeed

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
            IntroView(name: "Create and sharing your recipe ", image:"cooking" )
                .tag(0)
            IntroView(name: "Create and save your shopping list", image:"groceries" )
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
                            .frame(width: 350, height: 40)
                            .foregroundColor(.white)
                            .background(Color.AccentColor)
                            .cornerRadius(25)
                        }
                }
                .padding(.bottom , 15)
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
                            .foregroundColor(Color.black)
                            .font(.system(size: 25))
                            .background(Color.AccentColor)
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
                    .foregroundColor(Color.black)
                    .font(.system(size: 25))
                    .background(Color.AccentColor)
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

