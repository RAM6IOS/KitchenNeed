//
//  Profile.swift
//  KitchenNeed
//
//  Created by Bouchedoub Rmazi on 17/7/2022.
//

import SwiftUI
import CoreImage

struct Profile: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    @State private var FirsName: String = ""
    @State private var LastName: String = ""
    @State private var Email: String = ""
    var language = ["French", "Arabic", "English"]
    @State private var selectedlanguage = "Arabic"
   
    var body: some View {
            VStack{
                ZStack{
                    Image("default-avatar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 100 )
                        .clipShape(Circle())
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                        .foregroundColor(.white)
                        .offset(y:30)
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                       // select an image
                    showingImagePicker = true
                }
                  
               Form{
                    Section{
                    TextField("FirstName" , text: $FirsName)
                        .font(.system(size: 32 , weight: .bold))
                    TextField("LastName" , text: $LastName)
                        .font(.system(size: 32 , weight: .bold))
                     
                    }
                    Section(header:Text("Email")){
                        Text("wdj31104@yuoia.com")
                    }
                    Section("language"){
                        Picker("language", selection: $selectedlanguage) {
                            ForEach(language , id: \.self) {
                            Text($0)
                            }
                        }
                    }
                }
                Button{
                    
                } label: {
                    Text("Logout")
                        .bold()
                        .font(.title3)
                        .frame(width: 250, height: 40)
                        .foregroundColor(.white)
                }
                .background(Color.red)
                .cornerRadius(10)
                Spacer()
                
                }
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
        
            }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
    }
    
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}



