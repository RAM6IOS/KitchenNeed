//
//  Home.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 17/7/2022.
//

import SwiftUI



struct Home: View {
    @State private var isSheetPresented = false
    @State private var text = ""
    var body: some View {
        NavigationView{
            VStack{
                    Text("Home")
            }
            .sheet(isPresented:$isSheetPresented ){
                VStack {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum porttitor ligula quis faucibus. Maecenas auctor tincidunt maximus. Donec lectus dui, fermentum sed orci gravida, porttitor porta dui. ")
                    Spacer()
                }
                .frame(height: 200)
            }
            .navigationBarTitle("Home")
            .toolbar {
                        ToolbarItem( placement: .navigationBarTrailing) {
                            Button{
                                isSheetPresented.toggle()
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 30))
                            }
                        }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
