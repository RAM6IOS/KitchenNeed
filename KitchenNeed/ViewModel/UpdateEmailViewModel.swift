//
//  UpdateEmailViewModel.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 29/1/2023.
//

import Foundation
import Firebase

class  UpdateEmailViewModel2: ObservableObject {
    @Published var user: User
    init(user: User) {
        self.user = user
    }
    func updateEmail(password:String , newEmail: String){
        let user = Auth.auth().currentUser
        let credential = EmailAuthProvider.credential(withEmail: user!.email!, password: password)
        user?.reauthenticate(with: credential) { (authResult, error) in
            if let error = error {
                print("Error reauthenticating user: \(error)")
                return
            }
            user?.updateEmail(to: newEmail) { (error) in
                if let error = error {
                    print("Error changing email: \(error)")
                } else {
                    print("Email changed successfully")
                    
                    guard let userId = self.user.id else { return }
                    Firestore.firestore().collection("users").document( userId )
                        .updateData(["email": self.user.email]) { _ in
                            
                            print("Email updateData")
                            
                        }
                    
                }
            }
        }
        
        
    }
    
    
   /* func updatePassword(currentPassword:String , newPassword: String){
        let user = Auth.auth().currentUser

        let credential = EmailAuthProvider.credential(withEmail: user!.email!, password: currentPassword)

        user?.reauthenticate(with: credential, completion: { (authResult, error) in
           if let error = error {
              // Handle re-authentication error
              return
           }
           user?.updatePassword(to: newPassword, completion: { (error) in
              if let error = error {
                 // Handle password update error
                 return
              }
              // Password update successful
           })
        })
        
        
    }*/
    
}
