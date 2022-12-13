//
//  AuthViewModel.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 12/12/2022.
//


import Foundation
import FirebaseAuth
import SwiftUI
import FirebaseFirestore
import Firebase


class AuthViewModel: ObservableObject {
    
    @Published var userSession : FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
            self.userSession = Auth.auth().currentUser
            //self.fetchUser()
       // self.fetchUser()
        
        }
    
    func login(withEmail email: String, password: String) {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    print("DEBUG: Failed to register with error \(error.localizedDescription)")
                    return
                }
                
                guard let user = result?.user else { return }
                self.userSession = user
                self.fetchUser()
                print("DEBUG: Did Log user in.. \(String(describing: self.userSession?.email))")
            }
        }
    
    
    
    
    func register(withEmail email: String, password: String, fullname: String, username: String ,image: UIImage) {
        //self.didAuthenticateUser = true
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                            print("DEBUG: Failed to register with error \(error.localizedDescription)")
                            return
                        }
            print("success")
            guard let user = result?.user else { return }
            self.userSession = user
            print(self.userSession)
            let userData = ["email": email,
                                        "username": username.lowercased(),
                                        "fullname": fullname,
                                        "uid": user.uid]
                        
            Firestore.firestore().collection("users")
                            .document(user.uid)
                            .setData(userData) { _ in
                                //self.didAuthenticateUser = true
                            }
            self.uploadProfileImage(image)
            print(userData)
            
        }
         
    }
    
    func uploadProfileImage(_ image: UIImage) {
            guard let uid = userSession?.uid else { return }
            
            ImageUploader.uploadImage(image: image) { profileImageUrl in
                Firestore.firestore().collection("users")
                    .document(uid)
                    .updateData(["profileImageUrl": profileImageUrl]) { _ in
                        //self.userSession = self.tempUserSession
                        self.fetchUser()
                        print("User Session")
                            //self.didAuthenticateUser = false
                        //self.fetchUser()
                    }
                
            }
        }
    func fetchUser() {
            guard let uid = self.userSession?.uid else { return }
        
        fetchUser(withUid: uid) { user in
                    self.currentUser = user
                }
        }
    func fetchUser(withUid uid: String , completion: @escaping(User) -> Void) {
       // print("Dibagen")
            Firestore.firestore().collection("users")
                .document(uid)
                .getDocument { snapshot, _ in
                    guard  let  snapshot = snapshot else { return }
                    
                    guard let user = try? snapshot.data(as: User.self) else { return }
                    
                    completion(user)
                    //print(user.email)
                    //print(user.username)
                
                }
        }
    
    func logout() {
            userSession = nil
            try? Auth.auth().signOut()
        }

    
}



