//
//  SettingsView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 7/1/2023.

import SwiftUI
import MessageUI
import UIKit
struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    @State var name = ""
    @State private var sendEmail = false
    let constants = Contacting.shared
    var body: some View {
        NavigationView{
            VStack{
                List{
                    NavigationLink{
                        about()
                    } label: {
                        Text("about")
                    }
                    NavigationLink{
                        if let user = viewModel.currentUser {
                           UpdateIProfile(user: user)
                        }
                    }label: {
                        Image(systemName: "person")
                        Text("Change Profile")
                    }
                    NavigationLink{
                        if let user = viewModel.currentUser {
                            UpdateEmail(user: user)
                        }
                    } label: {
                        HStack{
                            Image(systemName: "envelope")
                            Text("Change Email")
                        }
                    }
                    NavigationLink{
                        if let user = viewModel.currentUser {
                            UpdatePassword(user: user)
                        }
                    } label: {
                        HStack{
                            Image(systemName: "lock")
                            Text("Change Password")
                        }
                    }
                    HStack{
                        Image("privacy-policy")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        Link("Privacy Policy", destination: URL(string: "https://akdili.vercel.app/")!)
                            .foregroundColor(.black)
                    }
                    HStack{
                        Image(systemName: "paperplane.fill")
                        Button{
                            sendEmail.toggle()
                        } label: {
                            HStack{
                                Text("Contact")
                                    .foregroundColor(.black)
                            }
                        }
                        .sheet(isPresented: $sendEmail) {
                            MailView(content: constants.contentPreText, to: constants.to,subject: constants.subject)
                        }
                    }
                    HStack{
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                           
                        Button{
                            viewModel.logout()
                        } label: {
                            HStack{
                                Text("Logout")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    
                    HStack{
                        Image(systemName: "trash")
                        Button{
                            viewModel.delete()
                        } label: {
                            HStack{
                                Text("Logout")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                
            }
            .toolbar {
                ToolbarItem( placement: .navigationBarLeading) {
                    Button(action: {
                        viewModel.fetchUser()
                        presentationMode.wrappedValue.dismiss()
                        
                    }) {
                        Text("Close")
                            .font(.system(size: 20))
                            .foregroundColor(.AccentColor)
                        
                    }
                    
                }
            }
            .navigationTitle("Settings")
        }
        }
    }




