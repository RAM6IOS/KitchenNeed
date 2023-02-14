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
    init( recipet: Recipet){
        self.viewModel2 = EditProductiVewModel(recipe: recipet)
    }
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Button {
                        viewModel2.showingImagePicker.toggle()
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
                    .sheet(isPresented: $viewModel2.showingImagePicker , onDismiss: loadImage) {
                        ImagePicker(selectedImage: $selectedImage)
                    }
                    Section("Recipe Name"){
                        TextField("name", text:$viewModel2.recipe.name )
                    }
                    DifficultyLevel(difficulty: $viewModel2.recipe.difficulty, difficultyLevel: viewModel2.difficultyLevel)
                    PickersEdit(selections: $viewModel2.recipe.categorie, categor: viewModel2.categories)
                    CookingTime(hours: $viewModel2.recipe.hours, minutes: $viewModel2.recipe.minutes)
                    CookingTemperature(degree: $viewModel2.recipe.degree, temperatures: $viewModel2.recipe.temperatures, temperaturesSymbol: viewModel2.temperaturesSymbol)
                    TextEditorRecipe(TextEdi: $viewModel2.recipe.definition, section: "Definition")
                    TextEditorRecipe(TextEdi: $viewModel2.recipe.ingredients, section: "Ingredients")
                    TextEditorRecipe(TextEdi: $viewModel2.recipe.preparation, section: "Preparation")
                    Button{
                        viewModel2.EditProducti()
                        if (selectedImage != nil) {
                            viewModel2.EditImage(image: (selectedImage ??  UIImage(named:"Recipe-avatar" ))!)
                        }
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
