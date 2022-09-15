
//  LogIn.swift
//  KitchenNeed
//  Created by Bouchedoub Rmazi on 14/9/2022.
import SwiftUI
struct LogIn: View {
    @State private var FirsName: String = ""
    @State private var Email: String = ""
    @Binding var ShowHome : Bool
    var body: some View {
        VStack{
            Spacer()
            Text("Welcome back")
                .font(.title3)
            VStack{
            Form{
                 
                 Section(header:Text("Email")){
                     TextField("email" , text: $Email)
                 }
                Section(header:Text("Email")){
                TextField("Name" , text: $FirsName)
                    
                }
             }
            }
           
            Button{
                withAnimation{
                   ShowHome.toggle()
                }
               print("reds")
            } label: {
                Text("Log In")
                    .bold()
                    .font(.title3)
                    .frame(width: 330, height: 50)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(25)
            }
        }
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn(ShowHome: .constant(true))
    }
}
