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
                        HStack{
                            Image(systemName: "envelope")
                            Text("Change Email")
                        }
                    }
                    NavigationLink{
                        
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
