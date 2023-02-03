//
//  Searchbar.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 24/1/2023.
//

import SwiftUI

struct Searchbar: View {
   // @State var searchText: String
    @ObservedObject var viewModel : RecipeViewModel
    var body: some View {
        HStack{
            TextField("Search ...", text: $viewModel.searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
        }
        .padding(.horizontal, 10)
    }
}

