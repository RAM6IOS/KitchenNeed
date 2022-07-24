//
//  Product.swift
//  KitchenNeed
//
//  Created by Benyoucef Mansour on 19/7/2022.
//

import Foundation

struct Products {
    var name: String
    var details: [String]?
    var icon: String?
}

extension Products {
    static let CarrotProduct = Products(name: "Carrot", details: ["1kg"], icon: "carrot")
}
