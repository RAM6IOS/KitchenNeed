//
//  DifficultyLevel.swift
//  KitchenNeed

import SwiftUI
struct DifficultyLevel: View {
    @Binding var difficulty :String
    var difficultyLevel : [String]
    var body: some View {
        Section("Difficulty Level"){
            Picker(selection: $difficulty , label: Text("")) {
                ForEach(difficultyLevel, id: \.self) { typ in
                    Text(typ).tag(typ)
                }
                    }
                   .frame(width: 350)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .pickerStyle(SegmentedPickerStyle())
        }
    }
}

