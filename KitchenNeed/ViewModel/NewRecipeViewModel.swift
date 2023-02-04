//
//  NewRecipeViewModel.swift
//  KitchenNeed
import Foundation
import Firebase
import FirebaseStorage
import UIKit
class NewRecipeViewModel :ObservableObject {
   @Published var showingImagePicker = false
   @Published var name = ""
   @Published var definition = ""
   @Published var ingredients = ""
   @Published var preparation  = ""
   @Published var time = ""
   @Published var degree = ""
   @Published var times = ""
    @Published var timesSymbol = ["h" ,"m"]
    @Published  var temperatures = ""
    @Published var temperaturesSymbol = ["F" , "C"]
    @Published var difficulty = "Easy"
   @Published var difficultyLevel = ["Easy" , "Moderate" ,"Challenging" ,"Professional"]
    @Published  var categorie = ""
    @Published var categories: [String] = ["Breakfast", "Lunch", "Dinner", "Dessert" , "Appetisers" , "Soups" ,"Salads" ,"Breads" ,"Baked" , "Sweet" ,"Pizza" ,"Poultry" ,"Meat" ,"Seafood","Rice" ,"Pasta" ,"Sides" ,"Sandwiches" ,"drinks" ,"Ice Cream"]
    @Published var hours: Int = 0
    @Published var minutes: Int = 0
    func uploadRecipe(withCaption name: String , definition: String , ingredients: String ,degree: String ,time: String ,preparation: String ,image: UIImage ,times:String,temperatures:String,difficulty:String,categorie:String,hours:Int,minutes:Int) {
        uploadRecipet(name: name, definition: definition, ingredients: ingredients , degree: degree , time: time,preparation:preparation, image: image ,times:times,temperatures:temperatures,difficulty:difficulty,categorie:categorie,hours:hours, minutes:minutes) { success in
            if success {
            } else {
            }
        }
    }
    
    func uploadRecipet(name: String,definition: String,ingredients: String, degree: String ,time:String,preparation:String,image: UIImage,times:String,temperatures:String,difficulty:String,categorie:String, hours:Int,minutes:Int,completion: @escaping(Bool) -> Void) {
        ImageUploader.uploadImage2(image: image) { recipetImageUrl in
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let data = ["uid": uid,
                        "name": name,
                        "definition": definition,
                        "ingredients":ingredients,
                        "preparation":preparation,
                        "time":time,
                        "degree":degree,
                        "times":times,
                        "temperatures":temperatures,
                        "difficulty":difficulty,
                        "categorie":categorie,
                        "hours": hours,
                        "minutes":minutes,
                        "recipetImageUrl": recipetImageUrl,
                        "timestamp": Timestamp(date: Date())] as [String: Any]
            Firestore.firestore()
                .collection("recipe")
                .document()
                .setData(data) { error in
                    if let error = error {
                        completion(false)
                        return
                    }
                    completion(true)
                }
        }
    }
}


