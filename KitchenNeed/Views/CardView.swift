
//  CardView.swift
//  KitchenNeed
//  Created by Bouchedoub Rmazi
import SwiftUI
import Firebase
struct CardView: View {
    @State private var isPresented = false
    @State private var isPresented2 = false
    @State private var name = ""
    let types = ["vegetable", "meat", "fruits", "bread" , "milk" ,"spices" ,"canned-food" ,"cleaning-materials"]
    var heightOptions = ["L","mL", "kg" ,"g"]
    var currencySymbol = ["$","€", "£" ,"¥"]
    @ObservedObject var viewModel :  ProductViewModel
    
    init(user:User){
        self.viewModel = ProductViewModel(user: user)
    }
    
    var body: some View {
        ScrollView{
            LazyVStack(alignment: .leading){
                ForEach(viewModel.product){ product  in
                    VStack{
                        
                        HStack(alignment: .center) {
                            VStack{
                                Image(product.type)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80)
                                    .padding(.all, 20)
                            }
                            VStack(alignment: .leading) {
                                Text(product.name)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                    .foregroundColor(.black)
                                Text("\(product.type)" )
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                    .foregroundColor(.gray)
                                HStack( spacing: 20){
                                    HStack{
                                        Text("\(product.quantity) \(product.heights)")
                                            .font(.system(size: 16, weight: .bold, design: .default))
                                            .foregroundColor(.black)
                                    }
                                    Spacer()
                                    HStack{
                                        Text("\(product.price) \(product.currency)" )
                                            .font(.system(size: 16, weight: .bold, design: .default))
                                            .foregroundColor(.black)
                                        
                                        
                                    }
                                }
                                
                                
                            }.padding(.trailing, 20)
                            
                            
                            Spacer()
                        }
                    }
                    
                    .frame(maxWidth: .infinity, alignment: .center)
                    //.background(Color(red: 32/255, green: 36/255, blue: 38/255))
                    .background(Color.iconcoler)
                    .modifier(CardModifier())
                    .alert("do you want to delete? ", isPresented: $isPresented2, actions: {
                        // 1
                          Button("No", role: .cancel, action: {})

                          Button("Delete", role: .destructive, action: {
                              guard let uid = Auth.auth().currentUser?.uid else { return }
                              guard let producId = product.id else { return }
                                  // [START delete_document]
                              Firestore.firestore().collection("product").document(producId).delete() { err in
                                      if let err = err {
                                          print("Error removing document: \(err)")
                                      } else {
                                          print("Document successfully removed!")
                                      }
                                  }
                              Firestore.firestore().collection("product").document(producId).delete { error in
                                  if let error = error {
                                    print("Unable to remove card: \(error.localizedDescription)")
                                  }
                                }
                          })
                        }, message: {
                          Text("Message")
                        })

                    .padding(.all, 10)
                }
            }

        }
        .foregroundColor(Color(.label))
        .contentShape(Rectangle())
        
        .onLongPressGesture(minimumDuration:0.3, maximumDistance:10 ){
            isPresented2.toggle()
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
