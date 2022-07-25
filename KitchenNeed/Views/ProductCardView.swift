//
//  ProductCardView.swift
//  KitchenNeed
//
//  Created by Benyoucef Mansour on 18/7/2022.
//

import SwiftUI

struct ProductCardView: View {
    var product: Products
    var selected : Bool = false
    var products: Product?
    
    var body: some View {
        VStack {
            Image(products?.type ?? "typ")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
            Text(products?.name ?? "name")
                .font(.system(size: 14))
                .fontWeight(.bold)
            Text(products?.quantity ?? "quantity")
        }
        .padding()
        .font(.system(size: 30))
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60)
        .background(Color(selected ? UIColor.white : UIColor.systemGray4))
        .cornerRadius(10)
        .shadow(radius: 10)
        .foregroundColor(.black)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(product: Products.CarrotProduct)
    }
}
