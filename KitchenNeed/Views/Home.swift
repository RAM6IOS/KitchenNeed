//
//  Home.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 17/7/2022.
import SwiftUI
import PartialSheet
struct Home: View {
    @State private var isSheetPresented = false
    @State private var searchText: String = ""
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.name)
    ]) var product: FetchedResults<Product>
    @Environment(\.managedObjectContext) var moc
    @StateObject var prospects = Prospects()
    @State private var shownList = false
    @State var isPresented = false
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Section("njreq"){
           CardView( filter: .contacted)
                    }
                }
                .listStyle(GroupedListStyle())
                }
            .environmentObject(prospects)
            .navigationBarTitle("Home")
            .toolbar {
                ToolbarItem( placement: .navigationBarTrailing) {
                    Button(action: {isSheetPresented.toggle()}) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 20))
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isSheetPresented){
                 SheetView()
                    .environmentObject(prospects)
            }
            }
        }
    }
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home( )
           // .environmentObject(Prospects())
    }
}
