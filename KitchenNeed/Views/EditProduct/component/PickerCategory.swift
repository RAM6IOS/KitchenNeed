//
//  PickerEdit.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 14/2/2023.
import SwiftUI
struct PickersEdit: View {
    @Binding var selections : String
    @State var categor :[String]
    
    
    var body: some View {
        Section("Recipe Category"){
            Picker(selection: $selections, label: Text("Categorie")) {
                ForEach(categor, id: \.self) { typ in
                    Text(typ).tag(typ)
                }
            }
        }
    }
}


