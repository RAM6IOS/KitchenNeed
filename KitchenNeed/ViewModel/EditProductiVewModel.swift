//
//  EditProductiVewModel.swift
//  KitchenNeed

import Foundation
import Firebase
import UIKit
class  EditProductiVewModel: ObservableObject {
    @Published var showingImagePicker = false
    var difficultyLevel = ["Easy" , "Moderate" ,"Challenging" ,"Professional"]
    var categories: [String] = ["Breakfast", "Lunch", "Dinner", "Dessert" , "Appetisers" , "Soups" ,"Salads" ,"Breads" ,"Baked" , "Sweet" ,"Pizza" ,"Poultry" ,"Meat" ,"Seafood","Rice" ,"Pasta" ,"Sides" ,"Sandwiches" ,"drinks" ,"Ice Cream"]
    @Published var temperatures = ""
    var temperaturesSymbol = ["F" , "C"]
    @Published var recipe: Recipet
    init(recipe: Recipet) {
        self.recipe = recipe
    }
    func EditImage(image: UIImage){
        ImageUploader.uploadImage2(image: image) { recipetImageUrl in
            guard let recipeId = self.recipe.id else { return }
            Firestore.firestore().collection("recipe").document( recipeId )
                .updateData(["recipetImageUrl":recipetImageUrl
                            ]) { _ in
              print("image")
                }
        }
    }
    func EditProducti(){
            guard let recipeId = self.recipe.id else { return }
            Firestore.firestore().collection("recipe").document( recipeId )
                .updateData(["name": self.recipe.name,
                             "definition": self.recipe.definition,
                             "ingredients":self.recipe.ingredients,
                             "preparation":self.recipe.preparation,
                             "difficulty":self.recipe.difficulty,
                             "categorie":self.recipe.categorie,
                             "time":self.recipe.time,
                             "hours":self.recipe.hours,
                             "minutes":self.recipe.minutes,
                             "degree":self.recipe.degree
                            ]) { _ in
                }
    }
}
