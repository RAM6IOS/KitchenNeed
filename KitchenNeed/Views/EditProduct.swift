//
//  EditProduct.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 13/1/2023.
//

import SwiftUI
import Kingfisher

struct EditProduct: View {
    @ObservedObject var viewModel2 : EditProductiVewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @State private var showingImagePicker = false
    init( recipet: Recipet){
      
        self.viewModel2 = EditProductiVewModel(recipe: recipet)
    }
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Button {
                        showingImagePicker.toggle()
                        
                       
                    } label: {
                        if let profileImage = profileImage {
                            profileImage
                                .resizable()
                                .scaledToFill()
                                .frame( height: 200 )
                                .clipShape(Rectangle())
                                .cornerRadius(10)
                                .padding(.horizontal,10)
                        } else{
                            KFImage(URL(string: viewModel2.recipe.recipetImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame( height: 200 )
                                .clipShape(Rectangle())
                                .cornerRadius(10)
                                .padding(.horizontal,10)
                        }
                        
                        
                    }
                    .sheet(isPresented: $showingImagePicker , onDismiss: loadImage) {
                        ImagePicker(selectedImage: $selectedImage)
                    }
                    Section("Recipe Name"){
                        TextField("name", text:$viewModel2.recipe.name )
                    }
                    Section("Definition"){
                        TextEditor( text:$viewModel2.recipe.definition)
                    }
                    Section("Ingredients"){
                        TextEditor( text:$viewModel2.recipe.ingredients)
                    }
                    Section("Time"){
                        TextField("Time", text:$viewModel2.recipe.time)
                    }
                    Section("Degree"){
                        TextField("Degree", text:$viewModel2.recipe.degree)
                    }
                    Button{
                        viewModel2.EditProducti(image: (selectedImage ??  UIImage(named: "default-avatar"))!)
                        
                    } label: {
                        Text("Save")
                            .bold()
                            .font(.title3)
                            .frame(width: 350, height: 40)
                            .foregroundColor(Color.backcoler)
                    }
                    .background(Color.AccentColor)
                    .cornerRadius(10)
                }
                
            }
            .navigationTitle("Edit Product")
            .toolbar {
                ToolbarItem( placement: .navigationBarLeading) {
                    Button(action: {presentationMode.wrappedValue.dismiss()}) {
                        HStack{
                            Image(systemName: "arrow.left")
                                .font(.system(size: 20))
                            Text("Close")
                                .font(.system(size: 20))
                                .foregroundColor(.AccentColor)
                        }
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




