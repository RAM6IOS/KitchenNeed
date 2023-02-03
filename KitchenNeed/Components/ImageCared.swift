//
//  ImageCared.swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 3/2/2023.
//

import SwiftUI
import Kingfisher

struct ImageCared: View {
    var image: String
    var body: some View {
        KFImage(URL(string: image))
            .resizable()
            .scaledToFill()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: nil, idealWidth: nil, maxWidth: UIScreen.main.bounds.width, minHeight: nil, idealHeight: nil, maxHeight: 300, alignment: .center)
            .clipped()
    }
}

