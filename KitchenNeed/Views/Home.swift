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
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            VStack(alignment:.leading) {
                ScrollView {
                    ButtonSheet()
                    Spacer()
                        .padding(.bottom, 10)
                    HStack {
                        Text("Shopping List")
                            .font(.title2)
                        Spacer()
                    }
                    LazyVGrid(columns: gridItemLayout, spacing: 20) {
                        ForEach((0...5), id: \.self) {_ in
                            ProductCardView(product: Product.CarrotProduct, selected: true)
                        }
                    }
                    .padding(.horizontal, 5)
                    HStack {
                        Text("Recent")
                            .font(.title2)
                        Spacer()
                    }
                    LazyVGrid(columns: gridItemLayout, spacing: 20) {
                        ForEach((0...11), id: \.self) {_ in
                            ProductCardView(product: Product.CarrotProduct)
                        }
                    }
                }
            }
            .padding(.horizontal, 5)
        }
        .attachPartialSheetToRoot()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
