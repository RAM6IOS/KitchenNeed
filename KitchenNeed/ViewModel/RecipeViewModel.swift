//
//  RecipeViewModel.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 25/12/2022.
//

import Foundation
import Firebase
class RecipeViewModel : ObservableObject {
    @Published var recipet = [Recipet]()
    @Published var searchText = ""
    @Published var searchText2 = ""
    @Published  var categories : [String] = ["all","Breakfast", "Lunch", "Dinner", "Dessert" , "Appetisers" , "Soups" ,"Salads" ,"Breads" ,"Baked" , "Sweet" ,"Pizza" ,"Poultry" ,"Meat" ,"Seafood","Rice" ,"Pasta" ,"Sides" ,"Sandwiches" ,"drinks" ,"Ice Cream"]
    @Published var isSheetPresented = false
    init() {
        fetchRecipet()
        }
    var searchableRecipe: [Recipet] {
            if searchText2.isEmpty && searchText.isEmpty{
                return recipet
            } else {
                let lowercasedQuery = searchText.lowercased()
                let lowercasedQuery2 = searchText2.lowercased()
                    return recipet.filter({
                        $0.categorie.lowercased().contains(lowercasedQuery2) ||  $0.name.lowercased().contains(lowercasedQuery)
                    })
            }
        }
    func fetchRecipet() {
        fetchrecipe{ recipet in
            self.recipet = recipet
            for index in 0 ..< recipet.count {
                            let uid = recipet[index].uid
                            self.fetchUser(withUid: uid) { user in
                                self.recipet[index].user = user
                            }
                        }
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
    func fetchrecipe(completion: @escaping([Recipet]) -> Void) {
        Firestore.firestore().collection("recipe")
                    .order(by: "timestamp", descending: true)
                    .addSnapshotListener { snapshot, _ in
                    guard let documents = snapshot?.documents else { return }
                    
                    let recipet  = documents.compactMap({ try? $0.data(as: Recipet.self)})
                    completion(recipet)
                       
                }
        }
    
    
    
}
