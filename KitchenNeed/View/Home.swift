//
//  Home.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 17/7/2022.
//

import SwiftUI
import PartialSheet


struct Home: View {
    @State private var isSheetPresented = false
    var body: some View {
        NavigationView{
            VStack{
            ButtonSheet()
                VStack{
                    Text("Home")
                }
            }
        }
        .attachPartialSheetToRoot()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
