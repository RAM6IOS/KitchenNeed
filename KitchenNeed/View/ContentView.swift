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
                    Label("Home", systemImage: "list.dash")
                }
            Profile()
                .tabItem {
                        Label("Profile", systemImage: "square.and.pencil")
                        }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
