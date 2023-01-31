//
//  UpdatePasswordViewModel.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 31/1/2023.
//

import Foundation
import Firebase

class UpdatePasswordViewModel: ObservableObject {
    
    @Published var user: User
    init(user: User) {
        self.user = user
    }
    
    
     func updatePassword(currentPassword:String , newPassword: String){
         let user = Auth.auth().currentUser

         let credential = EmailAuthProvider.credential(withEmail: user!.email!, password: currentPassword)

         user?.reauthenticate(with: credential, completion: { (authResult, error) in
            if let error = error {
               // Handle re-authentication error
               return
            }
             user?.updatePassword(to: newPassword) { (error) in
                 if let error = error {
                     print("Error changing email: \(error)")
                 } else {
                     print("Password changed successfully")
                 }
             }
            /*user?.updatePassword(to: newPassword, completion: { (error) in
               if let error = error {
                  // Handle password update error
                  return
               }
                print("Password changed successfully")
            })*/
         })
         
         
     }
    
}
