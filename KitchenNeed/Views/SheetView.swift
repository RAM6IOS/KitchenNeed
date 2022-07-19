//
//  SheetView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 18/7/2022.
//

import SwiftUI

struct SheetView: View {
    @State private var isPresented = false
    @State private  var isSheetPresented  = true
    @State private var text: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack {
                TextField("Search for fruits", text: $text)
                    .padding(.leading, 10)
                    .frame(height: 40)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(6)
                Spacer()
            }
            .frame(height: 300)

            .sheet(isPresented: $isPresented){
               
            }
           
        }
        .padding(.horizontal, 10)
        .partialSheet(isPresented: $isSheetPresented,
                      content: SheetView.init)
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
