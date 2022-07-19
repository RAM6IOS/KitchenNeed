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
            Spacer() }
        .onAppear(){
            isSheetPresented = false
        }
        .partialSheet(isPresented: $isSheetPresented, content: SheetView.init)
        .navigationBarTitle("Home")
        .toolbar {
            ToolbarItem( placement: .navigationBarTrailing) {
                Button(action: {isSheetPresented.toggle()}) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 20))
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
