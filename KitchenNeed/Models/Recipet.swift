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
    let  name : String
    let timestamp: Timestamp
    let uid: String
    let definition : String
    let ingredients : String
    let time : String
    let degree : String
    let recipetImageUrl : String
    var user: User?
 
}
