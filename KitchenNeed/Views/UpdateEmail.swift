//
//  UpdateEmail.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 29/1/2023.
//

import SwiftUI

struct UpdateEmail: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var name = ""
    
    var body: some View {
        VStack{
            HStack(alignment: .bottom){
                Image(systemName: "envelope")
                    .padding(.leading , 30)
                
                TextField("Email", text:$name)
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
                print(viewModel.email)
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

