//
//  UpdateIProfileViewModel.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 1/2/2023.
//

import Foundation
import Firebase
import UIKit

class  UpdateIProfileViewModel: ObservableObject {
    @Published var user: User
    
   
    init(user: User) {
        self.user = user
    }
    
    func updateIProfilImage(image:UIImage){
        guard let userId = self.user.id else { return }
        ImageUploader.uploadImage(image: image) { profileImageUrl in
             Firestore.firestore().collection("users").document(userId)
                 .updateData(["profileImageUrl":profileImageUrl
                             ]) { _ in
               print("image update")
                 }
         }
        
    }
    func updateIProfil(name: String ){
                    guard let userId = self.user.id else { return }
                    Firestore.firestore().collection("users").document( userId )
            .updateData(["name": self.user.name]) { _ in
                            print("name updateData")
                
                   
                           /* guard let userId = self.user.id else { return }
                            ImageUploader.uploadImage(image: image) { profileImageUrl in
                                Firestore.firestore().collection("users")
                                    .document(userId)
                                    .updateData(["profileImageUrl": profileImageUrl]) { _ in
    
                                        print("User Session")
                                    }
                            }*/
                            
                           /* ImageUploader.uploadImage2(image: image) { recipetImageUrl in
                                guard let userId = self.recipe.id else { return }
                                Firestore.firestore().collection("users").document(userId)
                                    .updateData(["recipetImageUrl":recipetImageUrl
                                                ]) { _ in
                                  print("Likes user\( recipetImageUrl)")
                                    }
                            }*/

                        }

        }
        }
        
        

