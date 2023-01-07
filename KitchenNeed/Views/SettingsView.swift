//
//  SettingsView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 7/1/2023.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .toolbar {
                ToolbarItem( placement: .navigationBarLeading) {
                    Button(action: {presentationMode.wrappedValue.dismiss()}) {
                        Image("Close")
                            .font(.system(size: 25))
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
