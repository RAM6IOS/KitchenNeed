//
//  SheetView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 18/7/2022.
//

import SwiftUI

struct SheetView: View {
    @State private var longer = false
    @State private  var isSheetPresented  = false
    @State private var text: String = "some text"
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                HStack {
                    Spacer()
                    TextField("Nmae" ,text: $text)
                    .font(.headline)
                    Button{
                        longer.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                    }
                    Spacer()
                }

                
            }
            .padding(0)
            .frame(height: 50)
            .sheet(isPresented:$longer ){
                VStack {
                    Divider()
                    Spacer()
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum porttitor ligula quis faucibus. Maecenas auctor tincidunt maximus. Donec lectus dui, fermentum sed orci gravida, porttitor porta dui. ")
                    Spacer()
                }
                .frame(height: 200)
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
