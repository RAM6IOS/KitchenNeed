//
//  UpdateEmail.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 29/1/2023.
//

import SwiftUI

struct UpdateEmail: View {
    @ObservedObject var viewModel :UpdateEmailViewModel2
    @EnvironmentObject var viewModel2: AuthViewModel
    @State var email = ""
    @State var password = ""
    init(user: User){
        self.viewModel = UpdateEmailViewModel2(user: user)
    }
    var body: some View {
        VStack{
            HStack(alignment: .bottom){
                Image(systemName: "envelope")
                    .padding(.leading , 30)
                
                TextField("Email", text:$viewModel.user.email)
                    .padding(.top, 20)
                    .foregroundColor(.blue)
            }
            Divider()
                .padding(.horizontal, 30)
                .padding(.top ,10)
            HStack(alignment: .bottom){
                Image(systemName: "lock")
                    .padding(.leading , 30)
                
                TextField("password", text:$password)
                    .padding(.top, 20)
                    .foregroundColor(.blue)
            }
            Divider()
                .padding(.horizontal, 30)
                .padding(.top ,10)
            Text("Need to change your email address?")
                .bold()
                .font(.title2)
            Text("type a new one above")
            Button{
                viewModel.updateEmail(password: password, newEmail: viewModel.user.email)
                viewModel2.fetchUser()
            } label: {
                Text("Change Email")
                    .bold()
                    .font(.title3)
                    .frame(width: 340, height: 50)
                    .foregroundColor(.white)
                    .background(Color.AccentColor)
                    .cornerRadius(20)
            }
            Spacer()
            
        }
        .navigationTitle("Email Settings")
    }
}

