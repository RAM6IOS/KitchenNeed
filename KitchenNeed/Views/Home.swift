//
//  Home.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 17/7/2022.
//

import SwiftUI
import PartialSheet

@available(iOS 15.0, *)
struct Home: View {
    @State private var isSheetPresented = false
    @State private var searchText: String = ""
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationView{
            VStack(alignment:.leading) {
                ScrollView {
                    //ButtonSheet()
                    Spacer()
                        .padding(.bottom, 10)
                    HStack {
                        Text("Shopping List")
                            .font(.title2)
                        Spacer()
                    }
                    LazyVGrid(columns: gridItemLayout, spacing: 20) {
                        ForEach((0...5), id: \.self) {_ in
                            ProductCardView(product: Products.CarrotProduct, selected: true)
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
                            ProductCardView(product: Products.CarrotProduct)
                        }
                    }
                }
            }
            .padding(.horizontal, 5)
            .navigationBarTitle("Home")
            .toolbar {
                ToolbarItem( placement: .navigationBarTrailing) {
                    Button(action: {isSheetPresented.toggle()}) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 20))
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isSheetPresented){
                SheetView()
            }
        }
        .attachPartialSheetToRoot()
    }
}
@available(iOS 15.0, *)
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



