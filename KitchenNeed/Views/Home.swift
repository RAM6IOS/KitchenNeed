//
//  Home.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 17/7/2022.
import SwiftUI
import PartialSheet
struct Home: View {
    @State private var isSheetPresented = false
  @State var ShowOnboarding = true
    @State private var searchText: String = ""
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.name)
    ]) var product: FetchedResults<Product>
    @Environment(\.managedObjectContext) var moc
    @StateObject var prospects = Prospects()
    //@EnvironmentObject var prospects: Prospects
    @State private var shownList = false
    
    @State var isPresented = false
    var body: some View {
        NavigationView{
            ScrollView{
            VStack{
            VStack{
               
                HStack{
                    Text("Shopping List:")
                        .font(.headline)
                        .padding(.horizontal , 14)
                        .padding(.vertical , 10)
                        .background(.white)
                        .cornerRadius(30)
                        .shadow(radius: 5)
                    Spacer()
                }
                .padding(.horizontal , 20)
           CardView( filter: .contacted)
                Spacer()
            }
        Spacer()
            .frame(height: 200)
                VStack{
                    Spacer()
                    HStack{
                        Text("Shopping Finch:")
                            .font(.headline)
                            .padding(.horizontal , 14)
                            .padding(.vertical , 10)
                            .background(.white)
                            .cornerRadius(30)
                            .shadow(radius: 5)
                        Spacer()
                    }
                    .padding(.horizontal , 20)
             CardView( filter: .uncontacted)
                }
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
            .fullScreenCover(isPresented:$ShowOnboarding, content: {
                Onboarding(ShowOnboarding: $ShowOnboarding)
            })
            }
        }
        }
    }
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
           // .environmentObject(Prospects())
    }
}
