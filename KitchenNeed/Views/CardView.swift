
//  CardView.swift
//  KitchenNeed
//  Created by Bouchedoub Rmazi
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
    @State private var isPresented2 = false
    @State private var name = ""
    var body: some View {
            ForEach(filteredProspects) { products in
        VStack{
            HStack{
                VStack{
                Image("default-avatar")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(12)
                }
                VStack{
                    Text(products.name)
                        .font(.title3)
                        .foregroundColor(products.isContacted ? Color.white : Color.black)
                    LazyVGrid(columns: gridItemLayout) {
                        Text("Tag1")
                            .padding(.horizontal,10)
                            .padding(.vertical,5)
                            .background(.white)
                            .cornerRadius(5)
                            .shadow(radius: 5)
                        Text("Tag2")
                            .padding(.horizontal,10)
                            .padding(.vertical,5)
                            .background(.white)
                            .cornerRadius(5)
                            .shadow(radius: 5)
                        Text("Tag3")
                            .padding(.horizontal,10)
                            .padding(.vertical,5)
                            .background(.white)
                            .cornerRadius(5)
                            .shadow(radius: 5)
                    }
                    VStack{
                    Text("quantity")
                            .foregroundColor(Color.black)
                    Text("Name Fr")
                            .foregroundColor(products.isContacted ? Color.white : Color.black)
                    }
                }
            }
        }
                .foregroundColor(Color(.label))
                .padding()
                .background(products.isContacted ? Color.green : Color.white)
                .cornerRadius(20)
                .shadow(radius: 5)
                .padding()
        .onTapGesture {
            if products.isContacted {
               
                    prospects.toggle(products)
            } else {
                    prospects.toggle(products)
            }
                }
        .onLongPressGesture(minimumDuration:0.2, maximumDistance:10 ){
            isPresented2.toggle()
        }
        .sheet(isPresented: $isPresented2 ){
            Text(" @State private var isPresented = false")
            
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
