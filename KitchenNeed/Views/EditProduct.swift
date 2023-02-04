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
                    Section("Difficulty Level"){
                        Picker(selection: $viewModel2.recipe.definition, label: Text("")) {
                            ForEach(viewModel2.difficultyLevel, id: \.self) { typ in
                                Text(typ).tag(typ)
                            }
                                }
                               .frame(width: 350)
                                .background(Color.yellow)
                                .cornerRadius(10)
                                .pickerStyle(SegmentedPickerStyle())
                       
                    }
                    Section("Recipe Category"){
                        Picker(selection: $viewModel2.recipe.categorie, label: Text("Categorie")) {
                            ForEach(viewModel2.categories, id: \.self) { typ in
                                Text(typ).tag(typ)
                            }
                                }
                    }
                    Section("Cooking Time"){
                        HStack {
                            Picker("", selection: $viewModel2.recipe.hours){
                                ForEach(0..<24, id: \.self) { i in
                                    Text("\(i) hours").tag(i)
                                }
                            }.pickerStyle(WheelPickerStyle())
                                .frame(width: 140)
                            Picker("", selection: $viewModel2.recipe.minutes){
                                ForEach(0..<60, id: \.self) { i in
                                    Text("\(i) min").tag(i)
                                }
                            }.pickerStyle(WheelPickerStyle())
                                .frame(width: 140)
                        }
                    }
                    Section("Cooking Temperature"){
                        HStack{
                            TextField("temperature" ,text:$viewModel2.recipe.degree)
                            Picker("", selection: $viewModel2.temperatures) {
                                ForEach(viewModel2.temperaturesSymbol, id: \.self) { typ in
                                    HStack( spacing: 10){
                                        Text(typ)
                                        
                                    }
                                }
                            }
                        }
                    }
                    Section("Definition"){
                        TextEditor(text: $viewModel2.recipe.definition)
                            .lineSpacing(20)
                            .autocapitalization(.words)
                            .frame(height: 100)
                            .disableAutocorrection(true)
                            .padding()
                    }
                    Section("Ingredients"){
                        TextEditor(text: $viewModel2.recipe.ingredients)
                            .frame(minHeight: 100)
                    }
                    Section("Preparation"){
                        TextEditor(text: $viewModel2.recipe.preparation)
                            .lineSpacing(20)
                            .autocapitalization(.words)
                            .frame(height: 100)
                            .disableAutocorrection(true)
                            .padding()
                    }
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




