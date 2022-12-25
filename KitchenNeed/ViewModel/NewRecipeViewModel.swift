//
//  NewRecipeViewModel.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 23/12/2022.
//
/*
 @State private var name = ""
 @State private var definition = ""
 @State private var ingredients = ""
 @State private var preparation  = ""
 @State private var time = ""
 @State private var degree = ""
 */

import Foundation
import Firebase
import FirebaseStorage
import UIKit


class NewRecipeViewModel :ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    
    
    
    func uploadRecipe(withCaption name: String , definition: String , ingredients: String ,degree: String ,time: String ,preparation: String ,image: UIImage ) {
        uploadRecipet(name: name, definition: definition, ingredients: ingredients , degree: degree , time: time,preparation:preparation, image: image ) { success in
            if success {
                //dismiss view
               // self.didUploadTweeet = true
               // self.viewModel2.fetchTweets()
            } else {
                //show error
            }
        }
        
        
    }
    func uploadRecipet(name: String,definition: String,ingredients: String, degree: String ,time:String,preparation:String,image: UIImage,completion: @escaping(Bool) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let data = ["uid": uid,
                            "name": name,
                             "definition": definition,
                             "ingredients":ingredients,
                             "preparation":preparation,
                             "time":time,
                             "degree":degree,
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
                        uploadProfileImage(image, id: uid)
                        
                    }
       
    }
    
    
  
    
}

func uploadProfileImage(_ image: UIImage , id: String) {
    guard let uid = Auth.auth().currentUser?.uid else { return }
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
    }



