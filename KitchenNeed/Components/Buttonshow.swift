//
//  Buttonshow.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 22/1/2023.
//

import SwiftUI

struct Buttonshow: View {
    @Binding var  showLgn : Bool
    @State var teite1:String
    @State var teite2:String
    var body: some View {
        Button{
            withAnimation{
            showLgn.toggle()
            }
        } label: {
            HStack{
                Text(teite1)
                    .font(.footnote)
                    .foregroundColor(.backcoler)
                Text(teite2)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.backcoler)
            }
        }
        .padding(.bottom, 32)
    }
}

