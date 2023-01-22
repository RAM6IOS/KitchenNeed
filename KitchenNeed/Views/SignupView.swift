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
    var body: some View {
        VStack{
            if viewModel.showLgn == true {
            VStack{
                LogIn(ShowHome: $ShowHome, showLgn: $viewModel.showLgn)
            }
        } else {
            VStack{
                Spacer()
                Text("Create your account")
                    .font(.largeTitle)
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
                                          .overlay(
                                                RoundedRectangle(cornerRadius: 90)
                                                              .stroke(Color.gray
                                                                      , lineWidth: 10)
                                                      )
                                                      .clipShape(Circle())
                                                      .padding(.top, 44)
                                                } else {
                                                    Image("default-avatar")
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 100, height: 100 )
                                                        .clipShape(Circle())
                                                        .overlay(
                                                                        RoundedRectangle(cornerRadius: 90)
                                                                            .stroke(Color.white
                                                                                    , lineWidth: 10)
                                                                    )
                                                                    .clipShape(Circle())
                                                                    .padding(.top, 44)
                                                        
                                                }
                            }
                            .sheet(isPresented: $viewModel.showingImagePicker , onDismiss: loadImage) {
                                            ImagePicker(selectedImage: $selectedImage)
                                        }
                VStack{
                    VStack{
                        TextFieldview(name: $viewModel.email, systemname: "envelope", nameField: "Email")
                        TextFieldview(name: $viewModel.name, systemname: "person", nameField: "Name")
                        TextFieldview(name: $viewModel.password, systemname: "lock", nameField: "Password")
                    }
                    Spacer()
                    Button{
                        withAnimation{
                            viewModel.register(withEmail: viewModel.email,
                                               password: viewModel.password,
                                                name: viewModel.name,
                                                image: (selectedImage ??  UIImage(named: "default-avatar"))!)
                            viewModel.password = ""
                            viewModel.email = ""
                            viewModel.name = ""
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
