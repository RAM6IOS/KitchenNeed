//
//  UpdatePassword.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 31/1/2023.
//

import SwiftUI

struct UpdatePassword: View {
    @State private var currentPassword: String = ""
    @State private var NewPassword: String = ""
    @State var showpassword = false
    @State var show = false
    @ObservedObject var viewModel :UpdatePasswordViewModel
    init(user: User){
        self.viewModel = UpdatePasswordViewModel(user: user)
    }
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("CurrentPassword")
                    .font(.title3)
                    .padding(.horizontal)
                HStack{
                    Image(systemName: "lock")
                    if showpassword{
                        TextField("currentPassword", text: $currentPassword)
                        Image(systemName: "eye")
                            .onTapGesture {
                                showpassword.toggle()
                            }
                    }else{
                        SecureField("currentPassword", text: $currentPassword)
                        Image(systemName: "eye.slash")
                            .onTapGesture {
                                showpassword.toggle()
                            }
                    }
                }
                .padding()
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(.horizontal)
            }
            VStack(alignment: .leading){
                Text("NewPassword")
                    .font(.title3)
                    .padding(.horizontal)
                    .padding(.top ,10)
                HStack{
                    Image(systemName: "lock")
                    if show{
                        TextField("NewPassword", text: $NewPassword)
                        Image(systemName: "eye")
                            .onTapGesture {
                                show.toggle()
                            }
                    }else{
                        SecureField("NewPassword", text: $NewPassword)
                        Image(systemName: "eye.slash")
                            .onTapGesture {
                                show.toggle()
                            }
                    }
                    
                }
                .padding()
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(.horizontal)
            }
            Button{
                viewModel.updatePassword(currentPassword: currentPassword, newPassword: NewPassword)
            } label: {
                Text("Change Password")
                    .bold()
                    .font(.title3)
                    .frame(width: 360, height: 40)
                    .foregroundColor(.white)
                    .background(Color.AccentColor)
                    .cornerRadius(20)
            }
            Spacer()
        }.navigationTitle("Password Serrings")
    }
    
}

