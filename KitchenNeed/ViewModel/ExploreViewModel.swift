//
//  ExploreViewModel.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 17/12/2022.
//

import Foundation
import Firebase
class ExploreViewModel: ObservableObject {
    @Published var product = [Produc]()
    init() {
            fetchUsers()
        }
    func fetchUsers() {
           fetchproduct{ product in
               self.product  = product
               for index in 0 ..< product.count {
                               let uid = product[index].uid
                   self.fetchUser(withUid: uid) { user in
                                   self.product [index].user = user
                               }
                           }
           }
        }
    func fetchproduct(completion: @escaping([Produc]) -> Void) {
        Firestore.firestore().collection("product")
                    .order(by: "timestamp", descending: true)
                    .addSnapshotListener { snapshot, _ in
                    guard let documents = snapshot?.documents else { return }
                    let product  = documents.compactMap({ try? $0.data(as: Produc.self)})
                    completion(product)
                }
        }
    func fetchUser(withUid uid: String , completion: @escaping(User) -> Void) {
            Firestore.firestore().collection("users")
                .document(uid)
                .getDocument { snapshot, _ in
                    guard  let  snapshot = snapshot else { return }
                    guard let user = try? snapshot.data(as: User.self) else { return }
                    completion(user)
                }
        }
}
