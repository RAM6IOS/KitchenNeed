
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
                .font(.largeTitle)
                .fontWeight(.semibold)
                .fontWeight(.heavy)
                .padding(.bottom , 10)
                .padding(.top , 10)
            
            VStack{
                VStack(spacing: 10){
                    
                        HStack(alignment: .bottom){
                            Image(systemName: "envelope")
                                .padding(.leading , 30)
                            
                            TextField("Email", text: $Email)
                                .padding(.top, 20)
                                .foregroundColor(.blue)
                        }
                        Divider()
                            .padding(.horizontal, 30)
                            .padding(.top ,10)
                    
                    VStack{
                        HStack(alignment: .bottom){
                            Image(systemName: "magnifyingglass")
                                .padding(.leading , 30)
                            
                            TextField("Password", text: $password)
                                .padding(.top, 20)
                                .foregroundColor(.blue)
                        }
                        Divider()
                            .padding(.horizontal, 30)
                            .padding(.top ,10)
                       /* HStack{
                            Spacer()
                            Text("Forget the assword?")
                                .foregroundColor(.blue)
                        }
                        .padding(.horizontal)
                        */
                    }
                }
                .padding(.bottom , 20)
                Button{
                    withAnimation{
                        viewModel.login(withEmail: Email, password: password)
                    }
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
            Spacer()
           
        }
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn(ShowHome: .constant(true), showLgn: .constant(false))
    }
}
