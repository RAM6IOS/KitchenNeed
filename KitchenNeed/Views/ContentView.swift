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
                //RegistrationView()
            } else{
                Home()
                 .tabItem {

                     Label("List", systemImage: "list.bullet.rectangle.portrait.fill")
                }
            
            GroupView()
                .tabItem {
                   Label("Group", systemImage: "person.3")
               }
            Profile()
                .tabItem {
                        Label("Profile", systemImage: "person.fill")
                        }
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
