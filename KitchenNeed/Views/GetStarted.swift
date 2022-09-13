//
//  GetStarted.swift
//  KitchenNeed
//  Created by Bouchedoub Rmazi on 13/9/2022.
import SwiftUI
struct GetStarted: View {
    @Binding  var ShowOnboarding :Bool
    @State private var showingPicker = false
    var body: some View {
        VStack{
            Text("Akdili")
                .font(
                        .system(size: 30)
                        .weight(.heavy)
                    )
                .padding(.vertical , 20)
            Text("we pay close attention to your needs because we care")
                .font(
                        .system(size: 30)
                    )
                .padding( 20)
            Image("coupe-shopping")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250 )
        }
    }
}

struct GetStarted_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        GetStarted(ShowOnboarding: .constant(true))
        }
    }
}
