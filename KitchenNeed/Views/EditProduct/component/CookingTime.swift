//
//  CookingTime.swift
//  KitchenNeed
//  Created by Bouchedoub Ramzi on 14/2/2023.
import SwiftUI
struct CookingTime: View {
    @Binding var hours:Int
    @Binding var minutes:Int
    var body: some View {
        Section("Cooking Time"){
            HStack {
                Picker("", selection: $hours){
                    ForEach(0..<24, id: \.self) { i in
                        Text("\(i) hours").tag(i)
                    }
                }.pickerStyle(WheelPickerStyle())
                    .frame(width: 140)
                Picker("", selection: $minutes){
                    ForEach(0..<60, id: \.self) { i in
                        Text("\(i) min").tag(i)
                    }
                }.pickerStyle(WheelPickerStyle())
                    .frame(width: 140)
            }
        }
    }
}

