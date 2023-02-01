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
            
            Button{
                viewModel.updateIProfil( name: viewModel.user.name, image: (selectedImage ??  UIImage(named: "default-avatar"))!)
                viewModel2.fetchUser()
            } label: {
                Text("Save")
                    .bold()
                    .font(.title3)
                    .frame(width: 350, height: 40)
                    .foregroundColor(Color.backcoler)
            }
            .background(Color.AccentColor)
            .cornerRadius(10)
            Spacer()
        }
        .navigationTitle("EditProfile")
    }
    
    func loadImage() {
            guard let selectedImage = selectedImage else { return }
            profileImage = Image(uiImage: selectedImage)
        }
}

