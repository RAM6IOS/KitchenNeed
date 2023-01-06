//
//  fetchRecipeViewModel.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 6/1/2023.
//

import Foundation
import Firebase



class fetchRecipeViewModel: ObservableObject {
    
      let user: User!
    @Published  var recipet = [Recipet]()
    
    init(user: User   ) {
        self.user = user
        self.fetchUserRecipe()
        
    }
    
    func fetchUserRecipe() {
        guard let uid = user.id else { return }
        fetchRecipe(forUid: uid) { recipet in
            self.recipet = recipet
            for index in 0 ..< recipet.count {
                self.recipet[index].user = self.user
            }
                
        }
    }
    
    func fetchRecipe(forUid uid: String, completion: @escaping([Recipet]) -> Void) {
            Firestore.firestore().collection("recipe")
                .whereField("uid", isEqualTo: uid)
                .addSnapshotListener { snapshot, _ in
                    guard let documents = snapshot?.documents else { return }
                    let recipet = documents.compactMap({ try? $0.data(as: Produc.self)}) as! [Recipet]
                    completion(recipet.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() }))
                }
        }
    
    
      
}
