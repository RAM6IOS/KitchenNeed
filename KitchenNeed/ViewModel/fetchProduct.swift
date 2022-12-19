//
//  fetchProduct.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 16/12/2022.
//

import Foundation

import Firebase


class ProductViewModel: ObservableObject {
    
    let user: User!
 @Published  var product = [Produc]()
    //@Published var pro: Produc
    init(user: User   ) {
        self.user = user
        //self.pro = pro
        self.fetchUserProduct()
        //self.remove(<#Produc#>)
        //self.remove(product)
    }
    
    func fetchUserProduct() {
        guard let uid = user.id else { return }
           fetchProduct(forUid: uid) { product in
            self.product =  product
            for index in 0 ..< product.count {
                self.product[index].user = self.user
            }
                
        }
    }
    
   
    func fetchProduct(forUid uid: String, completion: @escaping([Produc]) -> Void) {
            Firestore.firestore().collection("product")
                .whereField("uid", isEqualTo: uid)
                .addSnapshotListener { snapshot, _ in
                    guard let documents = snapshot?.documents else { return }
                    let product = documents.compactMap({ try? $0.data(as: Produc.self)}) as! [Produc]
                    completion(product.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() }))
                }
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
