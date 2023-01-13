//
//  EditProductiVewModel.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 13/1/2023.
//

import Foundation
import Firebase



class  EditProductiVewModel: ObservableObject {
    @Published var recipe: Recipet
    init(recipe: Recipet) {
        self.recipe = recipe
    }
    
   /* func uploadRecipet(name: String,definition: String,ingredients: String, degree: String ,time:String,preparation:String,image: UIImage,times:String,temperatures:String,difficulty:String,categorie:String,completion: @escaping(Bool) -> Void) {
        
        
        
        ImageUploader.uploadImage2(image: image) { recipetImageUrl in
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let data = ["uid": uid,
                        "name": name,
                        "definition": definition,
                        "ingredients":ingredients,
                        "preparation":preparation,
                        "time":time,
                        "degree":degree,
                        "times":times,
                        "temperatures":temperatures,
                        "difficulty":difficulty,
                        "categorie":categorie,
                        "recipetImageUrl": recipetImageUrl,
                        "timestamp": Timestamp(date: Date())] as [String: Any]
            Firestore.firestore()
                .collection("recipe")
                .document()
                .setData(data) { error in
                    if let error = error {
                        completion(false)
                        return
                    }
                    completion(true)
                    // self.uploadProfileImage(image )
                    
                    //}
                    
                }
        }
        
        
       /*  func uploadProfileImage(_ image: UIImage  ) {
         guard let uid = Auth.auth().currentUser?.uid else { return }
         // guard let uid = viewModel.userSession?.uid else { return }
         //guard var id = recipet.id else { return  }
         ImageUploader.uploadImage2(image: image) { recipetImageUrl in
         Firestore.firestore().collection("recipe")
         .document(uid)
         .updateData(["recipetImageUrl": recipetImageUrl]) { _ in
         //self.userSession = self.tempUserSession
         //self.fetchUser()
         print("User Session2")
         print(uid)
         //self.didAuthenticateUser = false
         //self.fetchUser()
         }
         
         }
         
         }*/
         
        
        
    }*/
    
    func EditProducti( ){
    
        guard let recipeId = recipe.id else { return }
        
        Firestore.firestore().collection("recipe").document( recipeId )
            .updateData(["name": recipe.name,
                         "definition": recipe.definition,
                         "ingredients":recipe.ingredients,
                         "time":recipe.time,
                         "degree":recipe.degree
                        ]) { _ in
                        
                       
                            //completion()
                            print("Likes user")
                        
                        
                    }
        print("jeks")
    }
   
}
