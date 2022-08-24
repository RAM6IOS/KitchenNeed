//
//  ContentView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 17/7/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Home()
                 .tabItem {
                    Label("Home", systemImage: "house.fill")
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
