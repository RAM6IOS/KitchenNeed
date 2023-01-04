
//  CardView.swift
//  KitchenNeed
//  Created by Bouchedoub Rmazi
import SwiftUI
import Firebase
struct CardView: View {
    @State private var isPresented = false
    @State private var isPresented2 = false
    @ObservedObject var viewModel :  ProductViewModel
    init(user:User){
        self.viewModel = ProductViewModel(user: user)
    }
    var body: some View {
        ScrollView{
            ForEach(viewModel.product){ product  in
                VStack{
                    HStack{
                        VStack{
                            Image(product.type)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                                .padding(.all, 20)
                        }
                        HStack{
                            VStack(alignment: .leading) {
                                Text(product.name)
                                    .font(.system(size: 25, weight: .bold, design: .default))
                                    .foregroundColor(.black)
                                    .padding(.bottom , -10)
                                HStack{
                                        Text(product.type)
                                            .font(Font.custom("HelveticaNeue-Medium", size: 16))
                                            .foregroundColor(Color.black)
                                            .padding([.leading, .trailing], 5)
                                            .background(Color.AccentColor)
                                            .cornerRadius(7)
 
                                    Spacer()
                                    Text("\(product.price)\(product.currency)")
                                        .font(.system(size: 25, weight: .bold, design: .default))
                                        .foregroundColor(Color.red)
                                }
                                Text("\(product.quantity)\(product.heights)" )
                                    .font(.system(size: 25, weight: .bold, design: .default))
                                    .foregroundColor(.black)
                                .padding(.top , -10)
                                
                            }
                        }
                        
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .overlay(
                    Button {
                        isPresented2.toggle()
                    } label: {
                        Image(systemName: "trash.fill")
                            .font(Font.system(size: 16))
                            .foregroundColor(Color.backcoler)
                            .padding([.leading, .trailing], 16)
                        .padding([.top, .bottom], 8)}
                    , alignment: .topTrailing)
                .background(Color.white)
                .modifier(CardModifier())
                .foregroundColor(Color(.label))
                .contentShape(Rectangle())
                .alert("do you want to delete? ", isPresented: $isPresented2, actions: {
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
}


struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}
