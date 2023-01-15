//
//  EditProductiVewModel.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 13/1/2023.
//

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
                             "time":self.recipe.time,
                             "degree":self.recipe.degree
                            ]) { _ in
                  print("Likes user")
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
