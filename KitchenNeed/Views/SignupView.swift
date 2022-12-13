//
//  SignupView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 1/9/2022.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct SignupView: View {
   @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @State private var showingImagePicker = false
    @Binding var ShowHome : Bool
    @State var showLgn = false
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var fullname: String = ""
    @State private var password: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
        if showLgn == true {
            VStack{
                LogIn(ShowHome: $ShowHome, showLgn: $showLgn)
            }
        } else {
            VStack{
                Spacer()
               
                Button {
                    showingImagePicker.toggle()
                            } label: {
                    if let profileImage = profileImage {
                                        profileImage
                                          .resizable()
                                          .scaledToFill()
                                          .frame(width: 180, height: 100)
                                          .overlay(
                                                          RoundedRectangle(cornerRadius: 90)
                                                              .stroke(Color.gray
                                                                      , lineWidth: 10)
                                                      )
                                                      .clipShape(Circle())
                                                      .padding(.top, 44)
                                                } else {
                                                    Image("default-avatar")
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 180, height: 100 )
                                                        .clipShape(Circle())
                                                        .overlay(
                                                                        RoundedRectangle(cornerRadius: 90)
                                                                            .stroke(Color.white
                                                                                    , lineWidth: 10)
                                                                    )
                                                                    .clipShape(Circle())
                                                                    .padding(.top, 44)
                                                        
                                                }
                            }
                            .sheet(isPresented: $showingImagePicker , onDismiss: loadImage) {
                                            ImagePicker(selectedImage: $selectedImage)
                                        }
                VStack{
                    
               Form{
                   Section("email"){
                   TextField("Email" , text: $email)
                       .font(.system(size: 15 , weight: .bold))
                   }
                   Section("username"){
                   TextField("Username" , text: $username)
                       .font(.system(size: 15 , weight: .bold))
                   }
                   Section("fullname"){
                   TextField("Fullname" , text: $fullname)
                       .font(.system(size: 15 , weight: .bold))
                   }
                   Section("password"){
                   TextField("Password" , text: $password)
                       .font(.system(size: 15 , weight: .bold))
                   }
                
                }
                    Button{
                        withAnimation{
                            viewModel.register(withEmail: email,
                                               password: password,
                                               fullname: fullname,
                                               username: username,
                                               image: selectedImage!)
                        }
                    } label: {
                        Text("Sign up")
                            .bold()
                            .font(.title3)
                            .frame(width: 330, height: 50)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(25)
                    }
                    Button{
                        withAnimation{
                        showLgn.toggle()
                        }
                    } label: {
                        Text("I alrea have an account")
                            .font(.footnote)
                    }
                }
                }
            
        }
        }
    }
    func loadImage() {
            guard let selectedImage = selectedImage else { return }
            profileImage = Image(uiImage: selectedImage)
        }
}
struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(  ShowHome: .constant(true))
    }
}
