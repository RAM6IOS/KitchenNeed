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
    enum FilterType {
        case  contacted, uncontacted
    }
    let filter: FilterType
    @EnvironmentObject var prospects: Prospects
    @State private var isPresented = false
    @State private var name = ""
    var body: some View {
        VStack{
            ForEach(filteredProspects) { products in
                    
        VStack{
            HStack{
                
                VStack{
                Image("typ")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 100)
                    .padding()
                }
                .background(Color.white)
                .cornerRadius(5)
                .shadow(radius: 10)
                VStack{
                    
                    Text(products.name)
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
                    Text("quantity")
                    
                    Text("Name Fr")
                            
                    }
                }
            }
            
        }
        .swipeActions {
            if products.isContacted {
                Button {
                    products.isContacted.toggle()
                } label: {
                    Label("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark")
                }
                .tint(.blue)
            } else {
                Button {
                    products.isContacted.toggle()
                } label: {
                    Label("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark")
                }
                .tint(.green)
            }
        }
       // .background(Color.white)
        //.cornerRadius(10)
        //.shadow(radius: 5)
        

                }

        }
        }
            var filteredProspects: [Prospect] {
                switch filter {
                
                case .contacted:
                    return prospects.people.filter { !$0.isContacted }
                case .uncontacted:
                    return prospects.people.filter { $0.isContacted }
                }
            }
   
}
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView( filter: .contacted)
             .previewInterfaceOrientation(.portrait)
    }
}
