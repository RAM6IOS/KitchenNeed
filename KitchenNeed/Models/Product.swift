//
//  Product.swift
//  KitchenNeed
//
//  Created by Benyoucef Mansour on 19/7/2022.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Products {
    var name: String
    var details: [String]?
    var icon: String?
}

extension Products {
    static let CarrotProduct = Products(name: "Carrot", details: ["1kg"], icon: "carrot")
}


struct Produc: Identifiable, Decodable {
    @DocumentID var id: String?
    let  name : String
    let timestamp: Timestamp
    let uid: String
    let quantity : String
    let type : String
    let price : String
    let currency : String
    let heights: String
    let type2 : String
    
    //var likes: Int
    
    var user: User?
    //var didLike: Bool? = false
}
