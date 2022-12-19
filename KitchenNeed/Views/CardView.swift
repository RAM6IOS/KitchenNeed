
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
        ScrollView{
            LazyVStack(alignment: .leading){
                ForEach(viewModel.product){ product  in
                    HStack(alignment: .center) {
                        Image(product.type)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 80)
                                        .padding(.all, 20)
                        
                        VStack(alignment: .leading) {
                            Text(product.type)
                                            .font(.system(size: 20, weight: .bold, design: .default))
                                            .foregroundColor(.black)
                            Text(product.name)
                                            .font(.system(size: 16, weight: .bold, design: .default))
                                            .foregroundColor(.gray)
                            
                            Text(product.name)
                                            .font(.system(size: 16, weight: .bold, design: .default))
                                            .foregroundColor(.gray)
                                        
                                    }.padding(.trailing, 20)
                        
                                    Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    //.background(Color(red: 32/255, green: 36/255, blue: 38/255))
                    .background(.white)
                    .modifier(CardModifier())
                    .padding(.all, 10)
                    
                    
                    
                }
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
    

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}
