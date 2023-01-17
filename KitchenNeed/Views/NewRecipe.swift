//
//  NewRecipe.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 23/12/2022.
//

import SwiftUI
import Firebase
import FirebaseFirestore


struct NewRecipe: View {
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @State private var showingImagePicker = false
    @State private var name = ""
    @State private var definition = ""
    @State private var ingredients = ""
    @State private var preparation  = ""
    @State private var time = ""
    @State private var degree = ""
    @State private var times = ""
    var timesSymbol = ["h" ,"m"]
    @State private var temperatures = ""
    var temperaturesSymbol = ["F" , "C"]
    @State var difficulty = "Easy"
    var difficultyLevel = ["Easy" , "Moderate" ,"Challenging" ,"Professional"]
    @State private var categorie = ""
    let categories: [String] = ["Breakfast", "Lunch", "Dinner", "Dessert" , "Appetisers" , "Soups" ,"Salads" ,"Breads" ,"Baked" , "Sweet" ,"Pizza" ,"Poultry" ,"Meat" ,"Seafood","Rice" ,"Pasta" ,"Sides" ,"Sandwiches" ,"drinks" ,"Ice Cream"]
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @ObservedObject var viewModel = NewRecipeViewModel()
    var body: some View {
        NavigationView{
     
                VStack() {
                    if #available(iOS 16.0, *) {
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
                            .sheet(isPresented: $showingImagePicker , onDismiss: loadImage) {
                                ImagePicker(selectedImage: $selectedImage)
                            }
                        
                            Section("Recipe Name"){
                                
                                TextField("Name" ,text:$name)
                            }
                            Section("Difficulty Level"){
                                Picker(selection: $difficulty, label: Text("")) {
                                    ForEach(difficultyLevel, id: \.self) { typ in
                                        Text(typ).tag(typ)
                                        
                                    }
                                        }
                                       .frame(width: 350)
                                        .background(Color.yellow)
                                        .cornerRadius(10)
                                        .pickerStyle(SegmentedPickerStyle())
                            }
                            Section("Recipe Category"){
                                Picker(selection: $categorie, label: Text("Categorie")) {
                                    ForEach(categories, id: \.self) { typ in
                                        Text(typ).tag(typ)
                                        
                                    }
                                        }
                                        
                            }
                            Section("Cooking Time"){
                                HStack {
                                    Picker("", selection: $hours){
                                        ForEach(0..<24, id: \.self) { i in
                                            Text("\(i) hours").tag(i)
                                        }
                                    }.pickerStyle(WheelPickerStyle())
                                        .frame(width: 140)
                                    Picker("", selection: $minutes){
                                        ForEach(0..<60, id: \.self) { i in
                                            Text("\(i) min").tag(i)
                                        }
                                    }.pickerStyle(WheelPickerStyle())
                                        .frame(width: 140)
                                }
                            }
                            Section("Cooking Temperature"){
                                HStack{
                                    TextField("temperature" ,text:$degree)
                                    Picker("", selection: $temperatures) {
                                        ForEach(temperaturesSymbol, id: \.self) { typ in
                                            HStack( spacing: 10){
                                                Text(typ)
                                                
                                            }
                                        }
                                    }
                                }
                            }
                            
                                 
                            Section("Definition"){
                                TextEditor(text: $definition)
                                    .lineSpacing(20)
                                    .autocapitalization(.words)
                                    .frame(height: 100)
                                    .disableAutocorrection(true)
                                    .padding()
                            }
                            Section("Ingredients"){
                                TextEditor(text: $ingredients)
                                    .frame(minHeight: 100)
                            }
                            Section("Preparation"){
                                TextEditor(text: $preparation)
                                    .lineSpacing(20)
                                    .autocapitalization(.words)
                                    .frame(height: 100)
                                    .disableAutocorrection(true)
                                    .padding()
                            }
                            
                            
                            
                        }
                        .background(Color.AccentColor)
                        Button{
                            viewModel.uploadRecipe(withCaption: name, definition: definition, ingredients: ingredients, degree: degree, time: time, preparation: preparation,image: (selectedImage ??  UIImage(named: "default-avatar"))!, times:times,temperatures:temperatures,difficulty:difficulty,categorie:categorie,hours:hours, minutes:minutes)
                            
                        } label: {
                            Text("Save")
                                .bold()
                                .font(.title3)
                                .frame(width: 300, height: 40)
                                .foregroundColor(Color.backcoler)
                        }
                        .background(Color.AccentColor)
                        .cornerRadius(10)
                        
                    } else {
                        // Fallback on earlier versions
                    }
                   
                    
                }
                
          
           .navigationBarTitle("New Recipe")
               
                
            }
        }
    func loadImage() {
            guard let selectedImage = selectedImage else { return }
            profileImage = Image(uiImage: selectedImage)
        }
    }


struct NewRecipe_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipe()
    }
}
