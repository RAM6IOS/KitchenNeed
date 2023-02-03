//
//  delete.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 3/2/2023.
//

import Foundation
import Firebase

struct DliteItem{
    static  func dlite(id:String){
        //guard let producId = id else { return }
        Firestore.firestore().collection("recipe").document(id).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
}
