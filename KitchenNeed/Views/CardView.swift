//
//  CardView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 23/8/2022.
//

import SwiftUI

struct CardView: View {
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        VStack{
            HStack{
                VStack{
                Image("vegetable")
                    .resizable()
                    .scaledToFill()
                    .padding()
                    .frame(width: 140, height: 150)
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(radius: 10)
                  
                }
                Spacer()
                VStack{
                    Text("Name")
                        .font(.title3)
                    LazyVGrid(columns: gridItemLayout) {
                        Text("Tag1")
                            .padding(.horizontal,10)
                            .padding(.vertical,5)
                            .background(.gray)
                            .cornerRadius(5)
                            
                        Text("Tag2")
                            .padding(.horizontal,10)
                            .padding(.vertical,5)
                            .background(.gray)
                            .cornerRadius(5)
                        Text("Tag3")
                            .padding(.horizontal,10)
                            .padding(.vertical,5)
                            .background(.gray)
                            .cornerRadius(5)
                    }
                    Text("Custmor ")
                    Text("Name Fr")
                }
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
.previewInterfaceOrientation(.portrait)
    }
}
