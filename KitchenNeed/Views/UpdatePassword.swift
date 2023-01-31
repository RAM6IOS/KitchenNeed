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
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("currentPassword")
                    .font(.title)
                    .padding(.horizontal)
                    
                ExtractedView(currentPassword: currentPassword, showpassword: $showpassword)
            }
            VStack(alignment: .leading){
                Text("NewPassword")
                    .font(.title)
                    .padding(.horizontal)
                    .padding(.top ,10)
                ExtractedView2(NewPassword: NewPassword, show: $show)
            }
            Button{
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

struct UpdatePassword_Previews: PreviewProvider {
    static var previews: some View {
        UpdatePassword()
    }
}

struct ExtractedView: View {
    @State var currentPassword: String
    @Binding var showpassword :Bool
    var body: some View {
       
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
    
}

struct ExtractedView2: View {
    @State var NewPassword: String
    @Binding var show :Bool
    var body: some View {
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
}
