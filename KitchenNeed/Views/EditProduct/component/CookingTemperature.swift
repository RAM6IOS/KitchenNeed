//
//  CookingTemperature.swift
//  KitchenNeed
import SwiftUI
struct CookingTemperature: View {
    @Binding var degree:String
    @Binding var temperatures:String
    var temperaturesSymbol:[String]
    var body: some View {
        Section("Cooking Temperature"){
            HStack{
                TextField("temperature" ,text:$degree)
                Picker("", selection: $temperatures) {
                    ForEach(temperaturesSymbol, id: \.self) { typ in
                        HStack( spacing: 10){
                            Text(typ)
                            
                        }
                    }
                }
            }
        }
    }
}

