//
//  AuthViewModel.swift
//  KitchenNeed
//  Created by Bouchedoub Ramzi on 12/12/2022.
import Foundation
import FirebaseAuth
import SwiftUI
import FirebaseFirestore
import Firebase
import FirebaseStorage


class AuthViewModel: ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var email: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var showLgn = false
    @Published  var showingImagePicker = false
    init() {
            self.userSession = Auth.auth().currentUser
            self.fetchUser()
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
    func register(withEmail email: String, password: String, name: String ,image: UIImage) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                            print("DEBUG: Failed to register with error \(error.localizedDescription)")
                            return
                        }
            print("success")
            guard let user = result?.user else { return }
            self.userSession = user
            let userData = ["email": email,
                                        "name": name,
                                        "uid": user.uid]
            Firestore.firestore().collection("users")
                            .document(user.uid)
                            .setData(userData) { _ in
                            }
            self.uploadProfileImage(image: image)
        }
    
    }
    func uploadProfileImage(image:UIImage) {
            guard let uid = userSession?.uid else { return }
            ImageUploader.uploadImage(image: image) { profileImageUrl in
                Firestore.firestore().collection("users")
                    .document(uid)
                    .updateData([
                        "profileImageUrl":profileImageUrl
                                ]) { _ in
                        self.fetchUser()
                        print("User Session")
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
            Firestore.firestore().collection("users")
                .document(uid)
                .getDocument { snapshot, _ in
                    guard  let  snapshot = snapshot else { return }
                    guard let user = try? snapshot.data(as: User.self) else { return }
                    completion(user)
                }
        }
    func logout() {
            userSession = nil
            try? Auth.auth().signOut()
        }
    func delete() {
        userSession = nil
        Auth.auth().currentUser?.delete{ error in
          if let error = error {
            print(error)
          } else {
          }
        }
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
            }
          }
        }
         
        
    }
}



