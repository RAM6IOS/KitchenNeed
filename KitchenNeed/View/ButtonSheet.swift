//
//  ButtonSheet.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 18/7/2022.
//

import SwiftUI
import PartialSheet

struct ButtonSheet: View {
    @State private var isSheetPresented = false
    var body: some View {
        HStack {
            Spacer()
            

            Spacer()
        }
        .onAppear(){
            isSheetPresented = true
        }
        .partialSheet(isPresented: $isSheetPresented,
                      content: SheetView.init)
        .navigationBarTitle("Home")
        .toolbar {
                    ToolbarItem( placement: .navigationBarTrailing) {
                        Button("SheeShow") {
                            isSheetPresented.toggle()
                        }
                    }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ButtonSheet_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSheet()
    }
}
