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
    @State private var name: String = ""
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
                Text("Create your account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .fontWeight(.heavy)
                    .padding(.bottom , 10)
                    .padding(.top , 10)
               
                Button {
                    showingImagePicker.toggle()
                            } label: {
                    if let profileImage = profileImage {
                                        profileImage
                                          .resizable()
                                          .scaledToFill()
                                          .frame(width: 100, height: 100)
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
                                                        .frame(width: 100, height: 100 )
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
                    
                    VStack{
                        HStack(alignment: .bottom){
                            Image(systemName: "envelope")
                                .padding(.leading , 30)
                            
                            TextField("Email", text: $email)
                                .padding(.top, 20)
                                .foregroundColor(.blue)
                        }
                        Divider()
                            .padding(.horizontal, 30)
                            .padding(.top ,10)
                      
                        
                        HStack(alignment: .bottom){
                            Image(systemName: "person")
                                .padding(.leading , 30)
                            
                            TextField("FullName", text: $name)
                                .padding(.top, 20)
                                .foregroundColor(.blue)
                        }
                        Divider()
                            .padding(.horizontal, 30)
                            .padding(.top ,10)
                        
                        HStack(alignment: .bottom){
                            Image(systemName: "lock")
                                .padding(.leading , 30)
                            
                            TextField("Password", text: $password)
                                .padding(.top, 20)
                                .foregroundColor(.blue)
                        }
                        Divider()
                            .padding(.horizontal, 30)
                            .padding(.top ,10)
                        
                    }
                    Spacer()
                    Button{
                        withAnimation{
                            viewModel.register(withEmail: email,
                                               password: password,
                                                name: name,
                                                image: (selectedImage ??  UIImage(named: "default-avatar"))!)
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
                        HStack{
                            Text("I alrea have an account")
                                .font(.footnote)
                            Text("Sign in")
                                .font(.footnote)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding(.bottom, 32)
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
