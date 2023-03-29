//
//  ResetPassword .swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 29/3/2023.
//

import Foundation
import Firebase
import UIKit
import FirebaseAuth

class ResetPassword : ObservableObject {
    func resetPassword(email:String) {
       
        Auth.auth().sendPasswordReset(withEmail: email ) { error in
            if let error = error {
                print("Error sending password reset email: \(error.localizedDescription)")
            } else {
                print("Password reset email sent successfully!")
            }
        }
    }
    
}

