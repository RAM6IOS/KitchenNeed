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
    @State  var selectedlanguage = "Arabic"
   
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    if (image != nil){
                        image?
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 100 )
                            .clipShape(Circle())
                            .shadow(radius: 40)
                            
                    } else {
                        Image("default-avatar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 100 )
                            .clipShape(Circle())
                       
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 17, height: 17)
                            .foregroundColor(.black)
                            .offset(y:40)
                         
                        image?
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 100 )
                            .clipShape(Circle())
                            .border(.green)
                            .shadow(radius: 40)
                        
                        
                    }
                }
                .onTapGesture {
                       // select an image
                    showingImagePicker = true
                }
                  
                Form{
                    Section("name"){
                    TextField("Name" , text: $FirsName)
                        .font(.system(size: 15 , weight: .bold))

                    }
                    Section(header:Text("Email")){
                        Text("wdj31104@yuoia.com")
                    }
                    Section("language"){
                        Picker("Please choose a language", selection: $selectedlanguage) {
                                ForEach(language, id: \.self) {
                                            Text($0)
                                        }
                                    }
                       // .pickerStyle(WheelPickerStyle())
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
           // .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}



