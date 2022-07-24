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
    
    var body: some View {
        VStack {
            Image(systemName: product.icon ?? "rabbit")
                .font(.system(size: 25))
                .padding(.bottom, 8)
            Text(product.name)
                .font(.system(size: 14))
                .fontWeight(.bold)
            ForEach(product.details ?? [],  id: \.self) { detail in
                    Text(detail)
                        .font(.caption2)
                }
        }
        .padding()
        .font(.system(size: 30))
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60)
        .background(Color(selected ? UIColor.systemGray : UIColor.systemGray4))
        .cornerRadius(10)
        .foregroundColor(.white)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(product: Products.CarrotProduct)
    }
}
