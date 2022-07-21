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
    @State private var searchText: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack {
                HStack{
                ZStack {
                    Rectangle()
                             .foregroundColor(Color(UIColor.systemGray6))
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("Search ..", text: $searchText)
                        
                    }
                    .padding(.leading, 13)
                         
                     }
                      .frame(height: 40)
                      .cornerRadius(13)
                      
                    Button{
                        
                    } label: {
                        Text("Save")
                    }
                    .padding(.trailing, 10)
                }
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
