
//  CardView.swift
//  KitchenNeed
//  Created by Bouchedoub Rmazi
import SwiftUI
struct CardView: View {
   
   
    //@EnvironmentObject var prospects: Prospects
    @State private var isPresented = false
    @State private var isPresented2 = false
    @State private var name = ""
    @ObservedObject var viewModel :  ProductViewModel
    //var produc: Produc
    init(user:User){
        self.viewModel = ProductViewModel(user: user)
        
    }
    
    var body: some View {
        List{
            ForEach(viewModel.product){ product  in
                Text(product.name)

            }
        }
            .foregroundColor(Color(.label))
            .contentShape(Rectangle())
            .onLongPressGesture(minimumDuration:0.2, maximumDistance:10 ){
                isPresented2.toggle()
            }
            .sheet(isPresented: $isPresented2 ){
                Text(" @State private var isPresented = false")
                
            }
        }
        
        
    }
    

