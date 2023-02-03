//
//  Categoriesbar.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 3/2/2023.
//

import SwiftUI

struct Categoriesbar: View {
    @ObservedObject var viewModel : RecipeViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
                    HStack() {
                        ForEach(viewModel.categories, id: \.self) { item in
                        Text(item)
                            .padding(7)
                            .padding(.horizontal)
                            .background(
                                    Rectangle()
                                    .cornerRadius(8)
                                    .foregroundColor(Color.AccentColor)
                                 .opacity(1/4)
                                        )
                            .onTapGesture {
                                if item == "all" {
                                    viewModel.searchText2 = ""
                                } else {
                                    viewModel.searchText2 = item
                                }
                                print("tttt\( viewModel.searchText2)")
                        }
                    }
                    }
                }
    }
}
