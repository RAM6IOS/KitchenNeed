//
//  Home.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 17/7/2022.
import SwiftUI
import PartialSheet
import Kingfisher
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
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        if let user = viewModel.currentUser {
            NavigationView{
                ZStack{
                   // Color.AccentColor
                      //  .ignoresSafeArea(.all, edges: .top)
                  
                        
                            VStack{
                                ScrollView{
                                    CardView(user: user)
                                }
                        

                    }
                    
                    .listStyle(GroupedListStyle())
                    
                    .environmentObject(prospects)
                    .navigationBarTitle("Home")
                    .toolbar {
                        ToolbarItem( placement: .navigationBarTrailing) {
                            
                            Button(action: {isSheetPresented.toggle()}) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 25))
                                    .foregroundColor(.AccentColor)
                                    
                            }
                            
                        }
                        ToolbarItem( placement: .navigationBarLeading) {
                            KFImage(URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 30, height: 30)
                            
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
            }
        }


extension Color {
    
    static let newPrimaryColor = Color("backcoler")
    static let fontcoler = Color("fontcoler")
    static let iconcoler = Color("iconcoler")
    static let cadcoler = Color("cadcoler")
    static let AccentColor = Color("AccentColor")
    static let backcoler = Color("backcoler")
    //cadcoler
    //
}

