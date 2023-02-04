//
//  Home.swift
//  KitchenNeed
import SwiftUI
import PartialSheet
import Kingfisher
struct Home: View {
    @State  var isSheetPresented = false
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationView{
                ZStack{
                            VStack{
                                ScrollView{
                                    CardView(user: user)
                                }
                    }
                    .listStyle(GroupedListStyle())
                    .navigationBarTitle("Shopping List")
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
                    }
                }
            }
        }
            }
        }




