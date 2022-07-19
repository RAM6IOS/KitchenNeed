//
//  Product.swift
//  KitchenNeed
//
//  Created by Benyoucef Mansour on 19/7/2022.
//

import Foundation

struct Product {
    var name: String
    var details: [String]?
    var icon: String?
}

extension Product {
    static let CarrotProduct = Product(name: "Carrot", details: ["1kg"], icon: "carrot")
}
