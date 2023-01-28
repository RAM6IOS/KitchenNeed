//
//  SignupView.swift
//  KitchenNeed
import SwiftUI
import Firebase
import FirebaseFirestore
struct SignupView: View {
   @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @Binding var ShowHome : Bool
    @EnvironmentObject var viewModel: AuthViewModel
    @State var email: String = ""
    @State var name: String = ""
    @State var password: String = ""
   @State var showpasword = false
    var body: some View {
        VStack{
            if viewModel.showLgn == true {
            VStack{
                LogIn(ShowHome: $ShowHome, showLgn: $viewModel.showLgn)
            }
        } else {
            VStack{
                Spacer()
                Image("1024")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    .padding(.top, 44)
                Text("Create your account")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .fontWeight(.heavy)
                    .padding(.bottom , 10)
                    .padding(.top , 10)
                Button {
                    viewModel.showingImagePicker.toggle()
                            } label: {
                    if let profileImage = profileImage {
                                        profileImage
                                          .resizable()
                                          .scaledToFill()
                                          .frame(width: 100, height: 100)
                                          .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                                      .padding(.top, 44)
                                                } else {
                                                    Image("default-avatar")
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 100, height: 100 )
                                                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                                                    .padding(.top, 44)
                                                        
                                                }
                            }
                            .sheet(isPresented: $viewModel.showingImagePicker , onDismiss: loadImage) {
                                            ImagePicker(selectedImage: $selectedImage)
                                        }
                VStack{
                    VStack{
                        TextFieldview(name: $email, systemname: "envelope", nameField: "Email")
                        TextFieldview(name: $name, systemname: "person", nameField: "Name")
                        //TextFieldview(name: $password, systemname: "lock", nameField: "Password")
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
                    }
                    Spacer()
                    Button{
                        withAnimation{
                            viewModel.register(withEmail: email,
                                               password: password,
                                                name: name,
                                                image: (selectedImage ??  UIImage(named: "default-avatar"))!)
                            if $viewModel.userSession != nil {
                                password = ""
                                email = ""
                                name = ""
                                
                            }
                        }
                    } label: {
                        Text("Sign up")
                            .bold()
                            .font(.title3)
                            .frame(width: 340, height: 50)
                            .foregroundColor(.white)
                            .background(Color.AccentColor)
                            .cornerRadius(25)
                    }
                    Buttonshow(showLgn:$viewModel.showLgn, teite1: "I alrea have an account", teite2: "Sign in")
                }
                }
        }
        }
    }
    func loadImage() {
            guard let selectedImage = selectedImage else { return }
            profileImage = Image(uiImage: selectedImage)
        }
}
