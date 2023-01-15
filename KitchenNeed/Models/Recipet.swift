//
//  Recipet.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 25/12/2022.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase


struct Recipet:Identifiable , Decodable{
    
    @DocumentID var id: String?
    var name : String
    var timestamp: Timestamp
    let uid: String
    var definition : String
    var ingredients : String
    var preparation : String
    var times : String
    var temperatures : String
    var difficulty: String
    var categorie : String
    var time : String
    var degree : String
    var recipetImageUrl : String
    var user: User?
 
}
