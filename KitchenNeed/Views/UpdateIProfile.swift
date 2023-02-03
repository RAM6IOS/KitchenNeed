//
//  UpdateIProfile.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 1/2/2023.
//

import SwiftUI
import Kingfisher

struct UpdateIProfile: View {
    @ObservedObject var viewModel :UpdateIProfileViewModel
    @EnvironmentObject var viewModel2: AuthViewModel
    @State private var selectedImage: UIImage?
     @State private var profileImage: Image?
    @State private var showingImagePicker = false
    init(user: User){
        self.viewModel = UpdateIProfileViewModel(user: user)
    }
    var body: some View {
        VStack{
            Button {
                showingImagePicker.toggle()
                        } label: {
                if let profileImage = profileImage {
                                    profileImage
                                      .resizable()
                                      .scaledToFill()
                                      .frame(width: 100, height: 100)
                                      .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                                  .padding(.top, 44)
                                            } else {
                                                KFImage(URL(string: viewModel.user.profileImageUrl))
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 100, height: 100 )
                                                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                                                .padding(.top, 44)
                                                    
                                            }
                        }
                        .sheet(isPresented: $showingImagePicker , onDismiss: loadImage) {
                            ImagePicker(selectedImage: $selectedImage)
                        }
                        .padding(.bottom ,10)
                                HStack{
                                    Image(systemName: "person")
                                    TextField("Name", text: $viewModel.user.name)
                                }
                                .padding()
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                                .padding(.horizontal)
                            
            VStack(alignment: .leading){
                Text("Need to change your Image and Name ?")
                    .bold()
                    .font(.title2)
                Text("type a new one above")
            }
            Button{
                viewModel.updateIProfil( name: viewModel.user.name)
                if (selectedImage != nil){
                    viewModel.updateIProfilImage( image: (selectedImage ??  UIImage(named: "default-avatar"))!)
                }
                viewModel2.fetchUser()
            } label: {
                Text("Save")
                    .bold()
                    .font(.title3)
                    .frame(width: 350, height: 50)
                    .foregroundColor(Color.backcoler)
            }
            .background(Color.AccentColor)
            .cornerRadius(10)
            .padding()
            Spacer()
        }
        .navigationTitle("EditProfile")
    }
    func loadImage() {
            guard let selectedImage = selectedImage else { return }
            profileImage = Image(uiImage: selectedImage)
        }
}

