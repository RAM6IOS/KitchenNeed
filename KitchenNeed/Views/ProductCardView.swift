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
    var showcaed = false
    var products: Product?
    
    var body: some View {
        GeometryReader{ reade in
        VStack {
            Image(products?.type ?? "typ")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
            Text(products?.name ?? "name")
                .font(.system(size: 15))
                .fontWeight(.bold)
            Text(products?.quantity ?? "quantity")
                .font(.system(size: 13))
                .fontWeight(.bold)
        }
        .font(.system(size: 30))
        .frame(width: reade.size.width, height: reade.size.height)
        //.frame(minWidth: 0, maxWidth: .infinity, minHeight: 60)
        //.background(Color(selected ? UIColor.white : UIColor.systemGray4))
        .background(Color.theme.twilightWhite)
        .cornerRadius(10)
        .shadow(radius: 10)
        .foregroundColor(.black)
    
        }
        .frame( height: 130
        )
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(product: Products.CarrotProduct)
    }
}
