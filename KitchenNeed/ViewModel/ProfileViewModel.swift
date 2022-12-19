//
//  ProfileViewModel.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 15/12/2022.
//

import Foundation
import Firebase


class Produc2ViewModel: ObservableObject {
    
    @Published var produc: Produc
   
    init(produc: Produc) {
            self.produc = produc
           
           //self.deleteDocument()
        }
    
    func deleteDocument() {
      
       
        remove(produc)
        //service.fetchTweets(forUid: <#T##String#>, completion: <#T##([Tweet]) -> Void#>)
        
     
       }
    
    func remove(_ produc: Produc) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let producId = produc.id else { return }
            // [START delete_document]
        Firestore.firestore().collection("tweets").document(producId).delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }
            }
        Firestore.firestore().collection("tweets").document(producId).delete { error in
            if let error = error {
              print("Unable to remove card: \(error.localizedDescription)")
            }
          }
        
        
        }
    
}
