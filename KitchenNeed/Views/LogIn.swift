
//  LogIn.swift
//  KitchenNeed
//  Created by Bouchedoub Rmazi on 14/9/2022.
import SwiftUI
struct LogIn: View {
    @State private var password: String = ""
    @State private var Email: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @Binding var ShowHome : Bool
    @Binding var showLgn : Bool
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
                TextField("Name" , text: $password)
                    
                }
             }
            }
            Button{
                withAnimation{
                  // ShowHome.toggle()
                    viewModel.login(withEmail: Email, password: password)
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
            Button{
                withAnimation{
                    showLgn = false
                }
            } label: {
                HStack{
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn(ShowHome: .constant(true), showLgn: .constant(false))
    }
}
