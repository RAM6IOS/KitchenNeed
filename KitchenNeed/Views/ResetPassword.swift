//
//  ResetPassword.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 29/3/2023.
//

import SwiftUI
import Firebase
import UIKit
import FirebaseAuth

struct ResetPasswordView: View {
    @State private var email = ""
    @ObservedObject var viewModel = ResetPassword()
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button{
                viewModel.resetPassword(email: email)
                print("Password reset email sent successfully!")
            }label: {
                Text("ResetPassword")
                    .bold()
                    .font(.title3)
                    .frame(width: 340, height: 50)
                    .foregroundColor(.white)
                    .background(Color.AccentColor)
                    .cornerRadius(20)
            }
        }
        
        
    }
}
    
