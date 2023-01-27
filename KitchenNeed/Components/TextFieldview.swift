//
//  TextFieldview.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 22/1/2023.
//

import SwiftUI

struct TextFieldview: View {
    @Binding var name : String
     var systemname : String
     var nameField : String
    var body: some View {
        VStack{
            HStack(alignment: .bottom){
                Image(systemName: systemname)
                    .padding(.leading , 30)
                
                TextField(nameField, text: $name)
                    .padding(.top, 20)
                    .foregroundColor(.blue)
            }
            Divider()
                .padding(.horizontal, 30)
                .padding(.top ,10)
          
            
        }
    }
}


