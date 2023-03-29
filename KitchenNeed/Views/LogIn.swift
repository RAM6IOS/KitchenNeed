
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
    @State var showpasword = false
    @State var showforgotpassword = false
    var body: some View {
        VStack{
            Spacer()
            Image("1024")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .padding(.top, 44)
            Text("Welcome back")
                .font(.title2)
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
                    if showpasword {
                        HStack(alignment: .bottom){
                            Image(systemName: "lock")
                                .padding(.leading , 30)
                            TextField("Password", text: $password)
                                .padding(.top, 20)
                                .foregroundColor(.blue)
                            Image(systemName: "eye")
                                .padding(.leading , 30)
                                .onTapGesture {
                                    withAnimation{
                                        self.showpasword.toggle()
                                    }
                                }
                        }
                        Divider()
                            .padding(.horizontal, 30)
                            .padding(.top ,10)
                        
                    } else{
                        HStack(alignment: .bottom){
                            Image(systemName: "lock")
                                .padding(.leading , 30)
                            
                            SecureField("Password", text: $password)
                                .padding(.top, 20)
                                .foregroundColor(.blue)
                            
                            Image(systemName: "eye.slash")
                                .padding(.leading , 30)
                                .onTapGesture {
                                    withAnimation{
                                        self.showpasword.toggle()
                                    }
                                }
                        }
                        Divider()
                            .padding(.horizontal, 30)
                            .padding(.top ,10)
                    }
                    Text("forgot password")
                        .fontWeight(.semibold)
                        .fontWeight(.heavy)
                        .padding(.bottom , 10)
                        .padding(.top , 10)
                        .onTapGesture {
                            showforgotpassword.toggle()
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
                        .background(Color.AccentColor)
                        .cornerRadius(25)
                }
                Buttonshow(showLgn:$showLgn, teite1:"Don't have an account?", teite2: "Sign Up")
                
            }
            .sheet(isPresented: $showforgotpassword) {
                ResetPasswordView()
                
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
