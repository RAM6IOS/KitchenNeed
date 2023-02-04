//
//   TextEditorRecipe.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 4/2/2023.
//

import SwiftUI

struct TextEditorRecipe: View {
    @Binding var TextEdi:String
    var section:String
    var body: some View {
        Section(section){
            TextEditor(text: $TextEdi)
                .frame(minHeight: 100)
        }
    }
}


