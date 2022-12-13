//
//  RegistrationView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 13/12/2022.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var fullname: String = ""
    @State private var password: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            VStack{
                //ExtractedView(imagename: "envelope", TextFildNme: "Email", Textname: eEmail)
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
                    
                    TextField("Username", text: $username)
                        .padding(.top, 20)
                        .foregroundColor(.blue)
                }
                Divider()
                    .padding(.horizontal, 30)
                    .padding(.top ,10)
                
                HStack(alignment: .bottom){
                    Image(systemName: "person")
                        .padding(.leading , 30)
                    
                    TextField("FullName", text: $fullname)
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
            VStack{
                
               
                    
                    Button{
                        
                       // viewModel.uploadProfileImage(selectedImage)
                        //viewModel.didAuthenticateUser.toggle()
                        //print(viewModel.didAuthenticateUser)
                        // sayHelloWorld(email: email, password: password)
                        
                    }label: {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 340, height: 50)
                            .background(Color.blue)
                            .clipShape(Capsule())
                            .padding()
                        
                    }
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                    .padding()
                }
                
            
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
