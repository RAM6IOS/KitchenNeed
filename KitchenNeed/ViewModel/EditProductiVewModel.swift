//
//  EditProductiVewModel.swift
//  KitchenNeed

import Foundation
import Firebase
import UIKit
class  EditProductiVewModel: ObservableObject {
    @Published var recipe: Recipet
    init(recipe: Recipet) {
        self.recipe = recipe
    }
    func EditProducti(image: UIImage){
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
                    ImageUploader.uploadImage2(image: image) { recipetImageUrl in
                        guard let recipeId = self.recipe.id else { return }
                        Firestore.firestore().collection("recipe").document( recipeId )
                            .updateData(["recipetImageUrl":recipetImageUrl
                                        ]) { _ in
                          print("Likes user\( recipetImageUrl)")
                            }
                    }
                }
    }
}
