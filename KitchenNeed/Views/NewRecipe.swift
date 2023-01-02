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
                        
                            Section{
                                
                                TextField("Time" ,text:$name)
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
                            Section("Cooking Time"){
                                HStack{
                                    TextField("Time" ,text:$time)
                                    Picker("", selection: $times) {
                                        ForEach(timesSymbol, id: \.self) { typ in
                                            HStack( spacing: 10){
                                                Text(typ)
                                                
                                            }
                                        }
                                    }
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
                            
                        }
                        Button{
                            viewModel.uploadRecipe(withCaption: name, definition: definition, ingredients: ingredients, degree: degree, time: time, preparation: preparation,  image: (selectedImage ??  UIImage(named: "default-avatar"))!)
                            
                            
                            
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
