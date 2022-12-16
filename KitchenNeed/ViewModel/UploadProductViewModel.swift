//
//  UploadProductViewModel.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 16/12/2022.
//

import Foundation
import Firebase


class UploadProductViewModel: ObservableObject {
    
    
    
    func uploadProduct(withCaption name: String , quantity: String ,type: String) {
        uploadProduct(name: name, quantity: quantity, type: type) { success in
            if success {
                //dismiss view
               // self.didUploadTweeet = true
               // self.viewModel2.fetchTweets()
            } else {
                //show error
            }
        }
        
        
    }
    func uploadProduct(name: String,quantity: String,type: String, completion: @escaping(Bool) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let data = ["uid": uid,
                            "name": name,
                             "quantity": quantity,
                             "type":type,
                            "timestamp": Timestamp(date: Date())] as [String: Any]
        Firestore.firestore()
                    .collection("tweets")
                    .document()
                    .setData(data) { error in
                        if let error = error {
                            completion(false)
                            
                            return
                        }
                        completion(true)
                        
                    }
    }
}
