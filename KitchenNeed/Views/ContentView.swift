//
//  ContentView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 17/7/2022.

import SwiftUI
struct ContentView: View {
    @State var ShowOnboarding = true
    @State var ShowHome = true
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        TabView {
            if viewModel.userSession == nil {
                SignupView( ShowHome: $ShowHome)
               
            } else{
                Home()
                        .tabItem {
                            
                            Label("List", systemImage: "list.bullet.rectangle.portrait.fill")
                        }
                Recipe()
                .tabItem {
                   Label("Group", systemImage: "person.3")
               }
                if let user = viewModel.currentUser {
                    Profile(user: user)
                        .tabItem {
                            Label("Profile", systemImage: "person.fill")
                        }
                }
            }
        }
        .onAppear {
                   if #available(iOS 15.0, *) {
                           let appearance = UITabBarAppearance()
                           UITabBar.appearance().scrollEdgeAppearance = appearance
                       }
                           }

        .fullScreenCover(isPresented:$ShowOnboarding, content: {
            Onboarding(ShowOnboarding: $ShowOnboarding)
        })
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
