//
//  User.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 12/12/2022.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase


struct User: Identifiable, Decodable {
    @DocumentID var id: String?
   // let username: String
    let name: String
    let profileImageUrl: String
    let email: String
    
    //var isCurrantUser : Bool { return Auth.auth().currentUser?.uid == id }
}
