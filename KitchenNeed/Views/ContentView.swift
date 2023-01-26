//
//  ContentView.swift
//  KitchenNeed
import SwiftUI
struct ContentView: View {
    @State var ShowOnboarding = false
    @State var ShowHome = true
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        TabView {
                    if viewModel.userSession == nil {
                        SignupView( ShowHome: $ShowHome)
                    } else{
                        if let user = viewModel.currentUser {
                        Home()
                            .tabItem {
                                Label("List", systemImage: "list.bullet.rectangle.portrait.fill")
                            }
                        Recipe()
                            .tabItem {
                                Label("Group", systemImage: "person.3")
                            }
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

