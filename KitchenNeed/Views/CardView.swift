//
//  CardView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 23/8/2022.
//

import SwiftUI

struct CardView: View {
     var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
    var products: Product?
    var body: some View {
      
        VStack{
            HStack{
                VStack{
                Image(products?.type ?? "typ")
                    .resizable()
                    .scaledToFill()
                    .padding()
                    .frame(width: 100, height: 100)
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(radius: 10)
                  
                }
                Spacer()
                VStack{
                    Text(products?.name ?? "name")
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
                     
                    Text(products?.quantity ?? "quantity")
                    
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
