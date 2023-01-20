//
//  SettingsView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 7/1/2023.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
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
                        
                    } label: {
                        Text("Privacy Policy")
                    }
                    NavigationLink{
                        
                    } label: {
                        Text("share")
                    }
                    
                }
                
                Button{
                    viewModel.logout()
                } label: {
                    Text("Logout")
                        .bold()
                        .font(.title3)
                        .frame(width: 350, height: 40)
                        .foregroundColor(.black)
                }
                .background(Color.AccentColor)
                .cornerRadius(15)
                
                
                
                
            }
            .toolbar {
                ToolbarItem( placement: .navigationBarLeading) {
                    Button(action: {presentationMode.wrappedValue.dismiss()}) {
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


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
