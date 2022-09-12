
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
            HStack{
                VStack{
                Image("fruits")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(12)
                }
                VStack{
                    Text(products.name)
                        .font(.system(size: 20, weight: .heavy, design: .default))
                        .foregroundColor( Color.black)
                    VStack{
                        HStack{
                    Text(" Quantity:1 kg")
                            .foregroundColor(Color.black)
                            Spacer()
                    Text("Name Fr: name")
                            .foregroundColor(Color.black)
                        }
                    }
                    LazyVGrid(columns: gridItemLayout ,spacing: 10) {
                        Text("Tag1")
                            .background(.white)
                        Text("Tag2")
                            .background(.white)
                        Text("Tag3")
                            .background(.white)
                    }
                }
            }
                .foregroundColor(Color(.label))
                .background( Color.white)
                .contentShape(Rectangle())
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
