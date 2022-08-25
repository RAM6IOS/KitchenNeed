//
//  CardView.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 23/8/2022.
//

import SwiftUI

struct CardView: View {
     var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
   
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.name)
    ]) var product: FetchedResults<Product>
    var body: some View {
        List {
            Section(header: Text("Shopping List")){
                ForEach(product) { products in
        VStack{
            HStack{
                VStack{
                Image(products.type ?? "typ")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 100)
                    .padding()
                   
                  
                }
                .background(Color.white)
                .cornerRadius(5)
                .shadow(radius: 10)
               
                VStack{
                    Text(products.name ?? "name")
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
                     
                    VStack{
                    Text(products.quantity ?? "quantity")
                    
                    Text("Name Fr")
                            
                    }
                       
                     
                }
               
            }
        }
        .swipeActions {
            Button {
                
            } label: {
                Label("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark")
            }
            .tint(.blue)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
                }
            }
        }
        .listStyle(.grouped)
        }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
.previewInterfaceOrientation(.portrait)
    }
}
