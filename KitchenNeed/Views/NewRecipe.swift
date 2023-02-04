//
//  NewRecipe.swift
//  KitchenNeed
//  Created by Bouchedoub Ramzi on 23/12/2022.
import SwiftUI
import Firebase
import FirebaseFirestore
struct NewRecipe: View {
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @ObservedObject var viewModel = NewRecipeViewModel()
    var body: some View {
        NavigationView{
                VStack() {
                    if #available(iOS 16.0, *) {
                        Form{
                            Button {
                                viewModel.showingImagePicker.toggle()
                            } label: {
                                if let profileImage = profileImage {
                                    profileImage
                                        .resizable()
                                        .scaledToFill()
                                        .frame( height: 200 )
                                        .clipShape(Rectangle())
                                        .cornerRadius(10)
                                        .padding(.horizontal,10)
                                } else {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .strokeBorder(lineWidth: 3)
                                        Image(systemName: "camera")
                                            .font(.largeTitle)
                                    }
                                    .frame(height: 200)
                                    .padding(.horizontal,10)
                                }
                            }
                            .sheet(isPresented: $viewModel.showingImagePicker , onDismiss: loadImage) {
                                ImagePicker(selectedImage: $selectedImage)
                            }
                        
                            Section("Recipe Name"){
                                TextField("Name" ,text:$viewModel.name)
                            }
                            Section("Difficulty Level"){
                                Picker(selection: $viewModel.difficulty, label: Text("")) {
                                    ForEach(viewModel.difficultyLevel, id: \.self) { typ in
                                        Text(typ).tag(typ)
                                    }
                                        }
                                       .frame(width: 350)
                                        .background(Color.yellow)
                                        .cornerRadius(10)
                                        .pickerStyle(SegmentedPickerStyle())
                            }
                            Section("Recipe Category"){
                                Picker(selection: $viewModel.categorie, label: Text("Categorie")) {
                                    ForEach(viewModel.categories, id: \.self) { typ in
                                        Text(typ).tag(typ)
                                    }
                                        }
                            }
                            Section("Cooking Time"){
                                HStack {
                                    Picker("", selection: $viewModel.hours){
                                        ForEach(0..<24, id: \.self) { i in
                                            Text("\(i) hours").tag(i)
                                        }
                                    }.pickerStyle(WheelPickerStyle())
                                        .frame(width: 140)
                                    Picker("", selection: $viewModel.minutes){
                                        ForEach(0..<60, id: \.self) { i in
                                            Text("\(i) min").tag(i)
                                        }
                                    }.pickerStyle(WheelPickerStyle())
                                        .frame(width: 140)
                                }
                            }
                            Section("Cooking Temperature"){
                                HStack{
                                    TextField("temperature" ,text:$viewModel.degree)
                                    Picker("", selection: $viewModel.temperatures) {
                                        ForEach(viewModel.temperaturesSymbol, id: \.self) { typ in
                                            HStack( spacing: 10){
                                                Text(typ)
                                            }
                                        }
                                    }
                                }
                            }
                            TextEditorRecipe(TextEdi: $viewModel.definition, section: "Definition")
                            TextEditorRecipe(TextEdi: $viewModel.ingredients, section: "Ingredients" )
                            TextEditorRecipe(TextEdi: $viewModel.preparation ,section: "Preparation")
                        }
                        .background(Color.AccentColor)
                        Button{
                            viewModel.uploadRecipe(withCaption: viewModel.name, definition: viewModel.definition, ingredients: viewModel.ingredients, degree: viewModel.degree, time: viewModel.time, preparation: viewModel.preparation,image: (selectedImage ??  UIImage(named: "Recipe-avatar"))!, times:viewModel.times,temperatures:viewModel.temperatures,difficulty:viewModel.difficulty,categorie:viewModel.categorie,hours:viewModel.hours, minutes:viewModel.minutes)
                        } label: {
                            Text("Save")
                                .bold()
                                .font(.title3)
                                .frame(width: 300, height: 40)
                                .foregroundColor(Color.backcoler)
                        }
                        .background(Color.AccentColor)
                        .cornerRadius(10)
                    } else {}
                }
           .navigationBarTitle("New Recipe")
            }
        }
    func loadImage() {
            guard let selectedImage = selectedImage else { return }
            profileImage = Image(uiImage: selectedImage)
        }
    }
