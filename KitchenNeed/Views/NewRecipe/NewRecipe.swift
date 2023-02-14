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
                            DifficultyLevel(difficulty: $viewModel.difficulty, difficultyLevel: viewModel.difficultyLevel)
                            PickersEdit(selections: $viewModel.categorie, categor: viewModel.categories)
                            CookingTime(hours: $viewModel.hours, minutes: $viewModel.minutes)
                            CookingTemperature(degree: $viewModel.degree, temperatures: $viewModel.temperatures, temperaturesSymbol: viewModel.temperaturesSymbol)
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
